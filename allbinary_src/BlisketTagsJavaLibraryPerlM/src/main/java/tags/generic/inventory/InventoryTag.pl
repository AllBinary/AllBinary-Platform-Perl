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

package tags::generic::inventory::InventoryTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::StoreValidationTransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws LicensingException
sub search {
    my ($self) = @_;
        try {
            my $anyType = 'taghelpers::InventoryHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("search", undef);
            my $result = $method->invoke($anyType, undef);
            $self->{pageContext}->getOut()->print($result);
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub viewSummary {
    my ($self) = @_;
        try {
            my $anyType = 'taghelpers::InventoryHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("viewSummary", undef);
            my $result = $method->invoke($anyType, undef);
            $self->{pageContext}->getOut()->print($result);
        } catch ($e) {
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if (defined($self->getCommand())) {
                if ($self->getCommand()->compareTo($tags::generic::inventory::org::allbinary->{globals}->{GLOBALS2}->{SEARCH}) == 0) {
                    $self->setName("Basic Search Inventory View");
                    $self->setObjectFile("views.generic.inventory.AutoSearchValidationInventoryView");
                    $self->search();
                    return $self->{EVAL_BODY_INCLUDE};
                } elsif ($self->getCommand()->compareTo($tags::generic::inventory::org::allbinary->{globals}->{GLOBALS2}->{VIEWSUMMARY}) == 0) {
                    $self->setName("Basic Inventory View");
                    $self->setObjectFile("views.generic.inventory.AutoValidationInventoryView");
                    $self->viewSummary();
                    return $self->{EVAL_BODY_INCLUDE};
                } elsif ($self->getCommand()->compareTo($tags::generic::inventory::org::allbinary->{globals}->{GLOBALS2}->{VIEW}) == 0) {
                    $self->setName("Basic Inventory View");
                    $self->setObjectFile("views.generic.inventory.AutoValidationInventoryView");
                    return $self->SUPER::doStartTag();
                } else {
                    die ("No Such View Command: " . $self->getCommand());
                }
            }
            die ("Command Null");
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::jsp::JspTagException;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use taghelpers::InventoryHelperFactory;
use tags::StoreValidationTransformTag;

1;

