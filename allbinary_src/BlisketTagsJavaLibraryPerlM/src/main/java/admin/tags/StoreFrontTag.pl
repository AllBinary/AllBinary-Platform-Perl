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

package admin::tags::StoreFrontTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{command} = undef;
    $self->{storeName} = undef;
    $self->{propertiesHashMap} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setCommand {
    my ($self, $command) = @_;
        $self->{command} = $command;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
}


# throws LicensingException
sub getCurrentLocation {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::StoreFrontHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $method = ref($anyType)->getMethod("getCurrentLocation", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub getCurrentHomeLocation {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::StoreFrontHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $method = ref($anyType)->getMethod("getCurrentHomeLocation", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if (defined($self->{command})) {
                $self->{propertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
                $self->{propertiesHashMap}->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
                if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{GETCURRENTLOCATION}) == 0) {
                    $self->{pageContext}->getOut()->print($self->getCurrentLocation());
                } elsif (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{GETCURRENTHOMELOCATION}) == 0) {
                    $self->{pageContext}->getOut()->print($self->getCurrentHomeLocation());
                }
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
use java::util::HashMap;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::StoreFrontHelperFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;

1;

