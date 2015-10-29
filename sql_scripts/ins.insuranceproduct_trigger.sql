create or replace function insuranceproduct_insert()
returns trigger as $insprd$
begin
     update ins.insuranceproduct 
     set insuranceid = new.insuranceproductid + 100100
     where insuranceid = 0
     and insuranceproductid = new.insuranceproductid;
     return NEW;
end;
$insprd$ language plpgsql;
create trigger insuranceproduct_insert
   after insert on ins.insuranceproduct
  for each row execute procedure insuranceproduct_insert() ;
