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

package admin::tags::BasicTextEmailTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{subject} = undef;
    $self->{body} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setSubject {
    my ($self, $value) = @_;
        $self->{subject} = $value;
}


sub setBody {
    my ($self, $value) = @_;
        $self->{body} = $value;
}


sub send {
    my ($self) = @_;
        try {
            my $propertiesHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $propertiesHashMap->put("Subject", $self->{subject});
            $propertiesHashMap->put("Body", $self->{body});
            my $anyType = 'admin::taghelpers::BasicTextEmailHelperFactory'->new()->getInstance($propertiesHashMap, $self->{pageContext});
            my $method = ref($anyType)->getMethod("send", undef);
            $method->invoke($anyType, undef);
            return "Email Sent";
        } catch ($e) {
            my $error = "Failed to Send Email.";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "send()", $e);
            }
            return $error;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            $self->{pageContext}->getOut()->print($self->send());
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
use java::util::HashMap;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::BasicTextEmailHelperFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use tags::CustomTagSupport;

1;

