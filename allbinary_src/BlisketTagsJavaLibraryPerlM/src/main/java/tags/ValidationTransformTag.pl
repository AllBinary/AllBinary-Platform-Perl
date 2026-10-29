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

package tags::ValidationTransformTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::TransformTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{xslFile} = undef;
    $self->{logic} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('taghelpers::ValidatedViewHelperFactory'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->{logic} = 1;
    return $self;
}


sub setXsl {
    my ($self, $value) = @_;
        $self->{xslFile} = $value;
        $self->setTemplateFile($self->{xslFile});
}


sub setLogic {
    my ($self, $logic) = @_;
        $self->{logic} = $logic;
}


# throws Exception
sub isValid {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->getHelper());
            my $method = $helperClass->getMethod($self->{commonStrings}->{IS_VALID}, undef);
            my $result = $method->invoke($self->getHelper(), undef);
            return $result;
        } catch ($e) {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            die $e;
        }
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        try {
            my $addressHelperClass = ref($self->getHelper());
            my $method = $addressHelperClass->getMethod("validationInfo", undef);
            my $result = $method->invoke($self->getHelper(), undef);
            return $result;
        } catch ($e) {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "validationInfo()", $e);
            }
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                my $request = $self->{pageContext}->getRequest();
                $stringBuffer->append("ValidationViewTag Start For: ");
                $stringBuffer->append($self->getName());
                $stringBuffer->append("\nView FIle: ");
                $stringBuffer->append($self->getObjectFile());
                $stringBuffer->append("\nRequest URI: ");
                $stringBuffer->append($request->getRequestURI());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
            }
            $self->setHelper();
            if ($self->isValid()) {
                $self->SUPER::doStartTag();
                if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("View File: ");
                    $stringBuffer->append($self->getObjectFile());
                    $stringBuffer->append("\nLogic includes body if true=");
                    $stringBuffer->appendboolean($self->{logic});
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
                }
                if ($self->{logic}) {
                    return $self->{EVAL_BODY_INCLUDE};
                } else {
                    return $self->{SKIP_BODY};
                }
            } else {
                $self->{pageContext}->getOut()->print($self->validationInfo());
                if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("View File: ");
                    $stringBuffer->append($self->getObjectFile());
                    $stringBuffer->append("\nisValid()=false");
                    $stringBuffer->append("\nLogic skips body if true=");
                    $stringBuffer->appendboolean($self->{logic});
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
                }
                if ($self->{logic}) {
                    return $self->{SKIP_BODY};
                } else {
                    return $self->{EVAL_BODY_INCLUDE};
                }
            }
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}


sub doEndTag {
    my ($self) = @_;
        if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF("Tag Ended", $self, "doEndTag");
        }
        $self->{logic} = 1;
        return $self->SUPER::doEndTag();
}

# use java::lang::reflect::Method;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::JspTagException;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::LicensingException;
use taghelpers::ValidatedViewHelperFactory;
use tags::TransformTag;

1;

