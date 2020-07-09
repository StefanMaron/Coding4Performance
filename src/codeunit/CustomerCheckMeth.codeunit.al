codeunit 50003 "Customer Check Meth"
{
    TableNo = Customer;

    trigger OnRun()
    var
        Handled: Boolean;
    begin
        OnBeforeCustomerCheck(Rec, Handled);

        DoCustomerCheck(Rec, Handled);

        OnAfterCustomerCheck(Rec);
    end;

    local procedure DoCustomerCheck(var Customer: Record Customer; var Handled: Boolean);
    begin
        if Handled then
            exit;

        // Do some checking on the customer

        if true in [
            Customer.Name = '',
            Customer.Address = '',
            Customer.City = '',
            Customer."Customer Posting Group" = ''
        ]
        then
            SetCustomerReleased(Customer, false)
        else
            SetCustomerReleased(Customer, true);

        Customer.Modify(false);
    end;

    local procedure SetCustomerReleased(var Customer: Record Customer; Released: Boolean)
    begin
        if Released then
            Customer.Validate(Blocked, Customer.Blocked::" ")
        else
            Customer.Validate(Blocked, Customer.Blocked::All);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCustomerCheck(var Customer: Record Customer; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCustomerCheck(var Customer: Record Customer);
    begin
    end;
}