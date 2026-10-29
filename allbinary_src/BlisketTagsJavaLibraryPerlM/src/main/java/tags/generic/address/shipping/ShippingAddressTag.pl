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

package tags::generic::address::shipping::ShippingAddressTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{value} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($tags::generic::address::shipping::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                    $self->setName("Basic Shipping Address View");
                    $self->setObjectFile("views.generic.address.shipping.ViewShippingAddressesView");
                } elsif ($self->getCommand()->compareTo($tags::generic::address::shipping::org::allbinary->{globals}->{GLOBALS2}->{EDIT}) == 0) {
                    $self->setName("Basic Shipping Address View");
                    $self->setObjectFile("views.generic.address.shipping.EditShippingAddressesView");
                } elsif ($self->getCommand()->compareTo($tags::generic::address::shipping::org::allbinary->{globals}->{GLOBALS2}->{NEW}) == 0) {
                    $self->setName("Basic Shipping Address View");
                    $self->setObjectFile("views.generic.address.shipping.NewShippingAddressesView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0) {
                    $self->setName("Basic Shipping Address View");
                    $self->setObjectFile("views.generic.address.shipping.AddShippingAddressesView");
                } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                    $self->setName("Basic Shipping Address View");
                    $self->setObjectFile("views.generic.address.shipping.DeleteShippingAddressesView");
                } elsif ($self->getCommand()->compareTo($org::allbinary::business::user::address::ShippingAddressData::SELECT) == 0) {
                    $self->setName("Basic Shipping Address View");
                    $self->setObjectFile("views.generic.address.shipping.SelectShippingAddressesView");
                } elsif ($self->getCommand()->compareTo($org::allbinary::business::user::address::ShippingAddressData::SETTOBILLINGADDRESS) == 0) {
                    $self->setName("Basic Shipping Address View");
                    $self->setObjectFile("views.generic.address.shipping.SetShippingAddressesView");
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
use org::allbinary::business::user::address::ShippingAddressData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::StoreValidationTransformTag;

1;

