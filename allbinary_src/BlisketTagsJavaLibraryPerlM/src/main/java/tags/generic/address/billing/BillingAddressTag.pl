#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package tags::generic::address::billing::BillingAddressTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($tags::generic::address::billing::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                    $self->setName("Basic Billing Address View");
                    $self->setObjectFile("views.generic.address.billing.ValidationView");
                } elsif ($self->getCommand()->compareTo($tags::generic::address::billing::org::allbinary->{globals}->{GLOBALS2}->{EDIT}) == 0) {
                    $self->setName("Basic Billing Address View");
                    $self->setObjectFile("views.generic.address.billing.EditValidationView");
                } elsif ($self->getCommand()->compareTo($tags::generic::address::billing::org::allbinary->{globals}->{GLOBALS2}->{NEW}) == 0) {
                    $self->setName("Basic Billing Address View");
                    $self->setObjectFile("views.generic.address.billing.NewValidationView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0) {
                    $self->setName("Basic Billing Address View");
                    $self->setObjectFile("views.generic.address.billing.AddValidationView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                    $self->setName("Basic Billing Address View");
                    $self->setObjectFile("views.generic.address.billing.DeleteValidationView");
                } elsif ($self->getCommand()->compareTo($org::allbinary::business::user::address::BillingAddressData::SELECT) == 0) {
                    $self->setName("Basic Billing Address View");
                    $self->setObjectFile("views.generic.address.billing.SelectValidationView");
                } elsif ($self->getCommand()->compareTo($org::allbinary::business::user::address::BillingAddressData::SETTOSHIPPINGADDRESS) == 0) {
                    $self->setName("Basic Billing Address View");
                    $self->setObjectFile("views.generic.address.billing.SetValidationView");
                } else {
                    die ("No Such View Command: " . $self->getCommand());
                }
                return $self->SUPER::doStartTag();
            }
            die ("Command Null");
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use org::allbinary::business::user::address::BillingAddressData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::StoreValidationTransformTag;

1;

