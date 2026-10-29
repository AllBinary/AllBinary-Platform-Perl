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

package admin::tags::CustomLoaderTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{command} = undef;
    $self->{webappPath} = undef;
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


sub setWebappPath {
    my ($self, $value) = @_;
        $self->{webappPath} = $value;
}


# throws LicensingException
sub setCustomLoaderWebappPath {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::CustomLoaderHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $helperClass = ref($anyType);
            my $methodParams = [ref($self->{webappPath})];
            my $methodArgs = [$self->{webappPath}];
            my $setMethod = $helperClass->getMethod("setWebappPath", $methodParams);
            $setMethod->invoke($anyType, $methodArgs);
        } catch ($e) {
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if (defined($self->{command})) {
                $self->{propertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
                if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{SET}) == 0) {
                    $self->setCustomLoaderWebappPath();
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
use admin::taghelpers::CustomLoaderHelperFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;

1;

