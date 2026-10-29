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

package admin::tags::AuthenticationTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{command} = undef;
    $self->{userName} = undef;
    $self->{password} = undef;
    $self->{newPassword} = undef;
    $self->{roles} = undef;
    $self->{propertiesHashMap} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->{userName} = $stringUtil->{EMPTY_STRING};
        $self->{password} = $stringUtil->{EMPTY_STRING};
    return $self;
}


sub setCommand {
    my ($self, $command) = @_;
        $self->{command} = $command;
}


sub setUserName {
    my ($self, $userName) = @_;
        $self->{userName} = $userName;
}


sub setPassword {
    my ($self, $value) = @_;
        $self->{password} = $value;
}


sub setNewPassword {
    my ($self, $value) = @_;
        $self->{newPassword} = $value;
}


sub setRoles {
    my ($self, $values) = @_;
        $self->{roles} = $values;
}


# throws LicensingException
sub changePassword {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationRequestHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("changePassword", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub newPassword {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationRequestHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("newPassword", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub invalidateSession {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("invalidateSession", undef);
            my $resultInteger = $method->invoke($anyType, undef);
            return int($resultInteger);
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub isSessionOld {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("isSessionOld", undef);
            my $resultBoolean = $method->invoke($anyType, undef);
            return $resultBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub isRoleValid {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationRequestHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $methodParams = [ref($self->{userName}), ref($self->{password}), ref($self->{roles})];
            my $method = $addressHelperClass->getMethod("isRoleValid", $methodParams);
            my $methodArgs = [$self->{userName}, $self->{password}, $self->{roles}];
            my $resultBoolean = $method->invoke($anyType, $methodArgs);
            return $resultBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub validRole {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("validRole", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub invalidRole {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("invalidRole", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub isAuthenticationSessionValid {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $methodParams = [ref($self->{roles})];
            my $method = $addressHelperClass->getMethod("isAuthenticationSessionValid", $methodParams);
            my $methodArgs = [$self->{roles}];
            my $resultBoolean = $method->invoke($anyType, $methodArgs);
            return $resultBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub processIfNewLogin {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $helperClass = ref($anyType);
            my $methodParams = [ref($self->{userName}), ref($self->{password})];
            my $method = $helperClass->getMethod("processIfNewLogin", $methodParams);
            my $methodArgs = [$self->{userName}, $self->{password}];
            my $resultBoolean = $method->invoke($anyType, $methodArgs);
            return $resultBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub processInvalidation {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::AuthenticationHelperFactory'->new()->getInstance($self->{propertiesHashMap}, $self->{pageContext});
            my $addressHelperClass = ref($anyType);
            my $method = $addressHelperClass->getMethod("processInvalidation", undef);
            my $resultBoolean = $method->invoke($anyType, undef);
            return $resultBoolean;
        } catch ($e) {
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                my $request = $self->{pageContext}->getRequest();
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append(" Request URI: ");
                $stringBuffer->append($request->getRequestURI());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if (defined($self->{command})) {
                $self->{propertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
                if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{NEWPASSWORD}) == 0) {
                    if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                        $self->{logUtil}->putF("New Password", $self, $self->{tagStrings}->{DO_START_TAG});
                    }
                    if (!$self->newPassword()) {
                        $self->{pageContext}->getOut()->print("New Password Request Failed.<p/>");
                        return $self->{EVAL_BODY_INCLUDE};
                    } else {
                        $self->{pageContext}->getOut()->print("New Password Was Sent.<p/>");
                        return $self->{SKIP_BODY};
                    }
                } elsif (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{CHANGEPASSWORD}) == 0) {
                    if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                        $self->{logUtil}->putF("Change Password", $self, $self->{tagStrings}->{DO_START_TAG});
                    }
                    if (!$self->changePassword()) {
                        $self->{pageContext}->getOut()->print("Password Change Attempt Failed.<p/>");
                        return $self->{EVAL_BODY_INCLUDE};
                    } else {
                        $self->{pageContext}->getOut()->print("Password Changed Successfully.<p/>");
                        return $self->{SKIP_BODY};
                    }
                } elsif (($self->{command} cmp $org::allbinary::logic::communication::http::request::session::WeblisketSessionData::INVALIDATESESSION) == 0) {
                    if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                        $self->{logUtil}->putF("INVALIDATESESSION", $self, $self->{tagStrings}->{DO_START_TAG});
                    }
                    return $self->invalidateSession();
                } else {
                    if ($self->isSessionOld()) {
                        if ($self->processInvalidation()) {
                            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                                $self->{logUtil}->putF("Processing Invalidation", $self, $self->{tagStrings}->{DO_START_TAG});
                            }
                            $self->{pageContext}->getOut()->print("Please login again.<p>");
                            if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{PROCESSBODYIFAUTHENTICATED}) == 0) {
                                return $javax::servlet::jsp::tagext::TagSupport::SKIP_BODY;
                            } else {
                                return $javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE;
                            }
                        } else {
                            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                                $self->{logUtil}->putF("Preparing session for invalidation", $self, $self->{tagStrings}->{DO_START_TAG});
                            }
                            if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{PROCESSBODYIFAUTHENTICATED}) == 0) {
                                return $javax::servlet::jsp::tagext::TagSupport::SKIP_BODY;
                            } else {
                                return $javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE;
                            }
                        }
                    }
                    if ((!defined($self->{userName}) || ($self->{userName} cmp $stringUtil->{EMPTY_STRING}) == 0) && (!defined($self->{password}) || ($self->{password} cmp $stringUtil->{EMPTY_STRING}) == 0) && defined($self->{roles}) && $self->isAuthenticationSessionValid()) {
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                            $self->{logUtil}->putF("Authenticated session is valid", $self, $self->{tagStrings}->{DO_START_TAG});
                        }
                        if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{PROCESSBODYIFAUTHENTICATED}) == 0) {
                            return $javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE;
                        } else {
                            return $javax::servlet::jsp::tagext::TagSupport::SKIP_BODY;
                        }
                    }
                    if (defined($self->{userName}) && defined($self->{password}) && $self->processIfNewLogin()) {
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                            $self->{logUtil}->putF("Processing new login.", $self, $self->{tagStrings}->{DO_START_TAG});
                        }
                        if ($self->isRoleValid()) {
                            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                                $self->{logUtil}->putF("Role is valid - Processing new login", $self, $self->{tagStrings}->{DO_START_TAG});
                            }
                            $self->{pageContext}->getOut()->print($self->validRole());
                            if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{PROCESSBODYIFAUTHENTICATED}) == 0) {
                                return $self->{EVAL_BODY_INCLUDE};
                            } else {
                                return $self->{SKIP_BODY};
                            }
                        } else {
                            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                                $self->{logUtil}->putF("Role is not valid - Processing new login", $self, $self->{tagStrings}->{DO_START_TAG});
                            }
                            $self->{pageContext}->getOut()->print($self->invalidRole());
                            if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{PROCESSBODYIFAUTHENTICATED}) == 0) {
                                return $self->{SKIP_BODY};
                            } else {
                                return $self->{EVAL_BODY_INCLUDE};
                            }
                        }
                    } else {
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                            $self->{logUtil}->putF("Invalid Login", $self, $self->{tagStrings}->{DO_START_TAG});
                        }
                        if (defined($self->{userName}) && ($self->{userName} cmp $stringUtil->{EMPTY_STRING}) != 0 && defined($self->{password}) && ($self->{password} cmp $stringUtil->{EMPTY_STRING}) != 0) {
                            $self->{pageContext}->getOut()->print("Sorry your username and/or password is invalid.<p/>");
                        }
                    }
                    if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Major authentication error - userName: ")->append($self->{userName})->append(" Password: ")->append($self->{password})->append(" Command: ")->append($self->{command})->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
                    }
                    if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{PROCESSBODYIFAUTHENTICATED}) == 0) {
                        return $javax::servlet::jsp::tagext::TagSupport::SKIP_BODY;
                    } else {
                        return $javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE;
                    }
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
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::JspTagException;
# use javax::servlet::jsp::tagext::TagSupport;
use admin::taghelpers::AuthenticationHelperFactory;
use admin::taghelpers::AuthenticationRequestHelperFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;

1;

