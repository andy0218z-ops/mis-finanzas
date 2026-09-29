-- SaveT · Permisos de Familia para Supabase
-- Ejecutar UNA SOLA VEZ en Supabase > SQL Editor con una cuenta administradora.
-- No contiene contraseñas ni claves.

begin;

grant usage on schema public to authenticated;

grant select, insert, update, delete on table
  public.familias,
  public.familia_miembros,
  public.invitaciones_familia,
  public.movimientos_familia,
  public.prestamos_familia,
  public.abonos_prestamo,
  public.presupuestos_familia,
  public.metas_familia
  to authenticated;

grant execute on function public.es_miembro_familia(uuid) to authenticated;
grant execute on function public.es_admin_familia(uuid) to authenticated;
grant execute on function public.es_creador_familia(uuid) to authenticated;
grant execute on function public.crear_familia_savet(text,text,text) to authenticated;

-- Refresca el esquema que usa la API REST de Supabase.
notify pgrst, 'reload schema';

commit;
