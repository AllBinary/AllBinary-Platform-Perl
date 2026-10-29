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

package tags::ModifyTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::HelperTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $tagHelperFactoryInterface) = @_;
    my $self = $class->SUPER::new($tagHelperFactoryInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws LicensingException
sub insert {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->getHelper());
            my $method = $helperClass->getMethod("insert", undef);
            my $result = $method->invoke($self->getHelper(), undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to insert";
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insert()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub delete {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->getHelper());
            my $method = $helperClass->getMethod($self->{commonStrings}->{delete}, undef);
            my $result = $method->invoke($self->getHelper(), undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to delete";
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub update {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->getHelper());
            my $method = $helperClass->getMethod("update", undef);
            my $result = $method->invoke($self->getHelper(), undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to update";
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                my $request = $self->{pageContext}->getRequest();
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Command: ");
                $stringBuffer->append($self->getCommand());
                $stringBuffer->append(" Request URI: ");
                $stringBuffer->append($request->getRequestURI());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            }
            if (defined($self->getCommand())) {
                $self->setHelper();
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                if ($self->getCommand()->compareTo($commonStrings->{INSERT}) == 0) {
                    my $output = $self->insert();
                    if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                        $self->{pageContext}->getOut()->print($output . "<br />");
                    }
                } elsif ($self->getCommand()->compareTo($commonStrings->{DELETE}) == 0) {
                    my $output = $self->delete();
                    if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                        $self->{pageContext}->getOut()->print($output . "<br />");
                    }
                } elsif ($self->getCommand()->compareTo($commonStrings->{UPDATE}) == 0) {
                    my $output = $self->update();
                    if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                        $self->{pageContext}->getOut()->print($output . "<br />");
                    }
                }
            }
            return $self->{EVAL_BODY_INCLUDE};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::TagHelperFactoryInterface;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonStrings;
use tags::HelperTag;

1;

