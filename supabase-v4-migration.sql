-- THE SEASON V4 — run once in Supabase SQL Editor
alter table public.lessons
add column if not exists evaluator_teacher_id bigint
references public.teachers(id)
on delete set null;

create index if not exists lessons_evaluator_teacher_id_idx
on public.lessons(evaluator_teacher_id);
