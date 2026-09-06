-- THE SEASON V5 — run once in Supabase SQL Editor

create table if not exists public.lesson_evaluators(
  lesson_id bigint not null references public.lessons(id) on delete cascade,
  teacher_id bigint not null references public.teachers(id) on delete cascade,
  primary key (lesson_id, teacher_id)
);

create table if not exists public.lesson_criteria(
  lesson_id bigint not null references public.lessons(id) on delete cascade,
  criterion_id bigint not null references public.criteria(id) on delete cascade,
  primary key (lesson_id, criterion_id)
);

alter table public.lesson_evaluators enable row level security;
alter table public.lesson_criteria enable row level security;

drop policy if exists "anon lesson evaluators crud" on public.lesson_evaluators;
create policy "anon lesson evaluators crud"
on public.lesson_evaluators for all to anon using(true) with check(true);

drop policy if exists "anon lesson criteria crud" on public.lesson_criteria;
create policy "anon lesson criteria crud"
on public.lesson_criteria for all to anon using(true) with check(true);

grant select, insert, update, delete on table public.lesson_evaluators to anon;
grant select, insert, update, delete on table public.lesson_criteria to anon;

-- If V4's single evaluator field already exists, migrate those assignments.
do $$
begin
  if exists (
    select 1 from information_schema.columns
    where table_schema='public' and table_name='lessons' and column_name='evaluator_teacher_id'
  ) then
    execute '
      insert into public.lesson_evaluators(lesson_id, teacher_id)
      select id, evaluator_teacher_id
      from public.lessons
      where evaluator_teacher_id is not null
      on conflict do nothing
    ';
  end if;
end $$;

-- Existing lessons initially assess all currently active criteria.
insert into public.lesson_criteria(lesson_id, criterion_id)
select l.id, c.id
from public.lessons l
cross join public.criteria c
where c.active = true
on conflict do nothing;
