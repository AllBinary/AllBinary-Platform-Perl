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

package admin::tags::TableTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::PropertiesTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{enabled} = undef;
    $self->{tagHelperFactoryInterface} = undef;
    $self->{tagRequestHelperFactoryInterface} = undef;
    $self->{requestObject} = undef;
    $self->{current} = undef;
    $self->{total} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub setIsSelected {
    my ($self, $enabled) = @_;
        $self->{enabled} = $enabled;
}


# throws Exception
sub isEnabled {
    my ($self) = @_;
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{enabled})) {
            if ('org::allbinary::logic::java::bool::BooleanUtil'->getInstance()->getFromString($self->{enabled}) || ($self->{enabled} cmp "on") == 0) {
                return 1;
            }
        }
        return 0;
}


sub setTagHelperFactory {
    my ($self, $tagHelperFactoryInterface) = @_;
        $self->{tagHelperFactoryInterface} = $tagHelperFactoryInterface;
}


sub getTagHelperFactoryInterface {
    my ($self) = @_;
        return $self->{tagHelperFactoryInterface};
}


sub setTagRequestHelperFactory {
    my ($self, $tagHelperFactoryInterface) = @_;
        $self->{tagRequestHelperFactoryInterface} = $tagHelperFactoryInterface;
}


sub getTagRequestHelperFactoryInterface {
    my ($self) = @_;
        return $self->{tagRequestHelperFactoryInterface};
}


sub setCurrent {
    my ($self, $current) = @_;
        $self->{current} = $current;
}


sub getCurrent {
    my ($self) = @_;
        return $self->{current};
}


sub setTotal {
    my ($self, $total) = @_;
        $self->{total} = $total;
}


sub getTotal {
    my ($self) = @_;
        return $self->{total};
}


# throws LicensingException
sub drop {
    my ($self) = @_;
        try {
            my $anyType = $self->getTagHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("drop", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to drop table";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{DROP}, $e);
            }
            return $error;
        }
}


# throws LicensingException
sub create {
    my ($self) = @_;
        try {
            my $anyType = $self->getTagHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("create", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to create table";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "create()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub restore {
    my ($self) = @_;
        try {
            my $anyType = $self->getTagHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("restore", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to restore backup";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "restore()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub backup {
    my ($self) = @_;
        try {
            my $anyType = $self->getTagHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("backup", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to make backup";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backup()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub insert {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->{requestObject});
            my $method = $helperClass->getMethod("insert", undef);
            my $result = $method->invoke($self->{requestObject}, undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to insert";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insert()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub delete {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->{requestObject});
            my $method = $helperClass->getMethod($self->{commonStrings}->{delete}, undef);
            my $result = $method->invoke($self->{requestObject}, undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to delete";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub update {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->{requestObject});
            my $method = $helperClass->getMethod("update", undef);
            my $result = $method->invoke($self->{requestObject}, undef);
            return $result;
        } catch ($e) {
            my $error = "Failed to update";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                my $request = $self->{pageContext}->getRequest();
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("TableTag Helper: ");
                $stringBuffer->append(ref($self->getTagHelperFactoryInterface()));
                $stringBuffer->append(" Request URI: ");
                $stringBuffer->append($request->getRequestURI());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if (defined($self->getTagRequestHelperFactoryInterface())) {
                if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                    $self->{logUtil}->putF("TableTag RequestHelper: " . ref($self->getTagRequestHelperFactoryInterface()), $self, $self->{tagStrings}->{DO_START_TAG});
                }
            } else {
                if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                    $self->{logUtil}->putF("TableTag RequestHelper: null", $self, $self->{tagStrings}->{DO_START_TAG});
                }
            }
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF("TableTag this.getCommand(): " . $self->getCommand(), $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if ($self->isEnabled()) {
                if (defined($self->getCommand())) {
                    if ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0 || $self->getCommand()->compareTo('org::allbinary::logic::communication::sql::SqlStrings'->getInstance()->{INSERT_INTO}) == 0 || $self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0 || $self->getCommand()->compareTo($self->{commonStrings}->{UPDATE}) == 0 || $self->getCommand()->compareTo('org::allbinary::logic::communication::sql::SqlStrings'->getInstance()->{UPDATE}) == 0) {
                        $self->{requestObject} = $self->getTagRequestHelperFactoryInterface()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
                    }
                    if ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0 || $self->getCommand()->compareTo('org::allbinary::logic::communication::sql::SqlStrings'->getInstance()->{INSERT_INTO}) == 0) {
                        $self->insert();
                    } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                        $self->delete();
                    } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{UPDATE}) == 0 || $self->getCommand()->compareTo('org::allbinary::logic::communication::sql::SqlStrings'->getInstance()->{UPDATE}) == 0) {
                        $self->update();
                    }
                    if ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{BACKUP}) == 0) {
                        my $output = $self->backup();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
                        return $self->{SKIP_BODY};
                    } elsif ($self->getCommand()->compareTo($admin::tags::org::allbinary->{globals}->{GLOBALS2}->{RESTORE}) == 0) {
                        $self->getPropertiesHashMap()->put("current", $self->getCurrent());
                        $self->getPropertiesHashMap()->put("total", $self->getTotal());
                        my $output = $self->restore();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
                        return $self->{SKIP_BODY};
                    } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DROP}) == 0) {
                        my $output = $self->drop();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
                        return $self->{SKIP_BODY};
                    } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{CREATE}) == 0) {
                        my $output = $self->create();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
                        return $self->{SKIP_BODY};
                    } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{INSERT}) == 0) {
                        my $output = $self->insert();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
                    } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{DELETE}) == 0) {
                        my $output = $self->delete();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
                    } elsif ($self->getCommand()->compareTo($self->{commonStrings}->{UPDATE}) == 0) {
                        my $output = $self->update();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output . "<br />");
                        }
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
use org::allbinary::logic::communication::sql::SqlStrings;
use org::allbinary::logic::java::bool::BooleanUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::PropertiesTag;

1;

