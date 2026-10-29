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

package admin::tags::FileAuthenticationTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{attemptsInteger} = undef;
    $self->{weblisketSession} = undef;
    $self->{request} = undef;
    $self->{command} = undef;
    $self->{userName} = undef;
    $self->{password} = undef;
    $self->{newPassword} = undef;
    $self->{authenticated} = undef;
    $self->{sessionUserName} = undef;
    $self->{role} = undef;
    $self->{timeout} = undef;
    $self->{roles} = undef;
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


sub makeSessionValid {
    my ($self, $storedRole, $userName) = @_;
        $self->{weblisketSession}->setAuthenticated();
        $self->{weblisketSession}->setRole($storedRole);
        $self->{weblisketSession}->setUserName($userName);
        $self->{request}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEUSERNAME);
        $self->{request}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEPASSWORD);
}


sub getFormData {
    my ($self) = @_;
        $self->{authenticated} = $self->{weblisketSession}->getAuthentication();
        $self->{sessionUserName} = $self->{weblisketSession}->getUserName();
        $self->{role} = $self->{weblisketSession}->getRole();
        $self->{attemptsInteger} = $self->{weblisketSession}->getAttempts();
        $self->{timeout} = $self->{weblisketSession}->getTimeout();
}


sub nextAttempt {
    my ($self) = @_;
        if (defined($self->{attemptsInteger}) && int($self->{attemptsInteger}) > 0) {
            $self->{weblisketSession}->setAttempts(int($self->{attemptsInteger}) + 1);
        } else {
            $self->{weblisketSession}->setAttempts(1);
        }
}


# throws LicensingException
sub changePassword {
    my ($self) = @_;
        try {
            my $userName = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEUSERNAME);
            my $password = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEPASSWORD);
            my $newPassword = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLENEWPASSWORD);
            my $newReenteredPassword = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEREENTERNEWPASSWORD);
            if (($newPassword cmp $newReenteredPassword) != 0) {
                return 0;
            }
            my $installerInfo = 'org::allbinary::business::init::InstallerInfo'->new();
            if ($installerInfo->isValid($userName, $password)) {
                $installerInfo->setPassword($newPassword);
                $installerInfo->write();
                $self->{weblisketSession}->setUserName($userName);
                $self->{weblisketSession}->setPassword($newPassword);
                return 1;
            }
            return 0;
        } catch ($e) {
            die $e;
        }
}


sub invalidateSession {
    my ($self) = @_;
        try {
            $self->{weblisketSession}->clear();
            return int($javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE);
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "invalidateSession()", $e);
            }
            return $javax::servlet::jsp::tagext::TagSupport::SKIP_BODY;
        }
}


# throws LicensingException
sub isSessionOld {
    my ($self) = @_;
        try {
            if (defined($self->{role})) {
                my $timeCreated = $self->{weblisketSession}->getCreationTime();
                my $sessionTimout = $self->{role}->getSessionTimeout();
                my $calendar = 'java::util::Calendar'->getInstance();
                my $timeFirst = $calendar->getTimeInMillis() - $sessionTimout;
                if ($timeFirst > $timeCreated) {
                    if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("Session Is Old - Timeout: ");
                        $stringBuffer->appendlong($sessionTimout);
                        $stringBuffer->append(" Eval: ");
                        $stringBuffer->appendlong($timeFirst);
                        $stringBuffer->append(" > ");
                        $stringBuffer->appendlong($timeCreated);
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, "isSessionOld()");
                    }
                    return 1;
                }
            } else {
                if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                    $self->{logUtil}->putF("Role Is Not In Session", $self, "isSessionOld()");
                }
            }
            return $self->isRarelyUsedSession();
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "isSessionOld()", $e);
            }
            return 0;
        }
}


sub isRarelyUsedSession {
    my ($self) = @_;
        if (defined($self->{role})) {
            my $timeCreated = $self->{weblisketSession}->getCreationTime();
            my $lastAccess = $self->{weblisketSession}->getLastAccessedTime();
            my $timePassed = $self->{role}->getSessionInactivityTimeout();
            my $calendar = 'java::util::Calendar'->getInstance();
            my $timeFirst = $calendar->getTimeInMillis() - $lastAccess;
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Session Is Rarely Used - Timeout: ");
                $stringBuffer->appendlong($lastAccess);
                $stringBuffer->append(" Eval: ");
                $stringBuffer->appendlong($timeFirst);
                $stringBuffer->append(" > ");
                $stringBuffer->appendlong($timePassed);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "isRarelyUsedSession()");
            }
        } else {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                $self->{logUtil}->putF("Role Is Not In Session", $self, "isRarelyUsedSession()");
            }
        }
        return 0;
}


# throws LicensingException
sub isRoleValid {
    my ($self) = @_;
        try {
            $self->makeSessionValid('org::allbinary::business::user::role::BasicUserRoleFactory'->getInstance()->{INSTALLER}, $self->{userName});
            return 1;
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "isRoleValid()", $e);
            }
            return 0;
        }
}


# throws LicensingException
sub validRole {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Trying New login<p>");
            return $stringBuffer->toString();
        } catch ($e) {
            my $error = "Failed to set valid role";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "validRole()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub invalidRole {
    my ($self) = @_;
        try {
            $self->{weblisketSession}->setAuthenticated(0);
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Sorry your username and password is invalid on this page.");
            $stringBuffer->append("Trying New login<p>");
            return $stringBuffer->toString();
        } catch ($e) {
            my $error = "Failed to set role invalid";
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "invalidRole()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub isAuthenticationSessionValid {
    my ($self) = @_;
        try {
            if ('org::allbinary::logic::java::bool::BooleanUtil'->getInstance()->getFromString($self->{authenticated})) {
                my $size = $self->{roles}->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $mustBeOfRole = $self->{roles}->get($index);
                    if (defined($self->{sessionUserName}) && $self->{role}->equals($mustBeOfRole)) {
                        return 1;
                    }
                }
                return 0;
            }
            return 0;
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "isAuthenticationSessionValid()", $e);
            }
            return 0;
        }
}


# throws LicensingException
sub processIfNewLogin {
    my ($self) = @_;
        try {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->putF("Starting for User: " . $self->{userName} . " Attempt: " . $self->{weblisketSession}->getAttempts(), $self, "processIfNewLogin()");
            }
            if (defined($self->{userName}) && ($self->{userName} cmp 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) != 0 && defined($self->{password}) && ($self->{password} cmp 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) != 0) {
                my $login = undef;
                my $installerInfo = 'org::allbinary::business::init::InstallerInfo'->new();
                if ($installerInfo->isValid($self->{userName}, $self->{password})) {
                    $login = $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{LOGINSUCCESS};
                } else {
                    $login = $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{LOGINFAILED};
                }
                if (($login cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{LOGINSUCCESS}) == 0) {
                    $self->{weblisketSession}->setAttempts(0);
                    return 1;
                }
                $self->nextAttempt();
                return 0;
            }
            $self->nextAttempt();
            return 0;
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processIfNewLogin()", $e);
            }
            return 0;
        }
}


# throws LicensingException
sub processInvalidation {
    my ($self) = @_;
        try {
            if ('org::allbinary::logic::java::bool::BooleanUtil'->getInstance()->getFromString($self->{timeout})) {
                $self->invalidateSession();
                return 1;
            }
            {
                $self->{weblisketSession}->setTimeout('org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE_STRING});
                return 0;
            }
        } catch ($e) {
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "isSetToInvalidate()", $e);
            }
            return 0;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
            $self->{request} = $self->{pageContext}->getRequest();
            $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::BasicWeblisketSession'->new($self->{pageContext});
            $self->getFormData();
            if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF("Started", $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if (defined($self->{command})) {
                if (($self->{command} cmp $admin::tags::org::allbinary->{globals}->{GLOBALS2}->{CHANGEPASSWORD}) == 0) {
                    if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                        $self->{logUtil}->putF("Change Password", $self, $self->{tagStrings}->{DO_START_TAG});
                    }
                    if (!$self->changePassword()) {
                        $self->{pageContext}->getOut()->print("Password Change Attempt Failed.<p>");
                        return $self->{EVAL_BODY_INCLUDE};
                    } else {
                        $self->{pageContext}->getOut()->print("Password Changed Successfully.<p>");
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
                        if (defined($self->{userName}) && ($self->{userName} cmp 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) != 0 && defined($self->{password}) && ($self->{password} cmp 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) != 0) {
                            $self->{pageContext}->getOut()->print("Sorry your username and/or password is invalid.<p>");
                        }
                    }
                    if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("Major authentication error - userName: ");
                        $stringBuffer->append($self->{userName});
                        $stringBuffer->append(" Password: ");
                        $stringBuffer->append($self->{password});
                        $stringBuffer->append(" Command: ");
                        $stringBuffer->append($self->{command});
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
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

use java::util::Calendar;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::JspTagException;
# use javax::servlet::jsp::tagext::TagSupport;
use org::allbinary::business::init::InstallerInfo;
use org::allbinary::business::user::role::BasicUserRole;
use org::allbinary::business::user::role::BasicUserRoleFactory;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::http::request::session::BasicWeblisketSession;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::java::bool::BooleanUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;

1;

