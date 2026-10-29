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

package admin::taghelpers::AuthenticationHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{authenticated} = undef;
    $self->{sessionUserName} = undef;
    $self->{role} = undef;
    $self->{timeout} = undef;
    $self->{attemptsInteger} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of AuthenticationHelper takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->_new2($hashMap, $pageContext->getRequest());
        # this(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $hashMap, $httpServletRequest) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $httpServletRequest);
        $self->getFormData();
        if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
            $self->{logUtil}->putF($self->outputSessionInfo(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws Exception
sub getFormData {
    my ($self) = @_;
        $self->{authenticated} = $self->{weblisketSession}->getAuthentication();
        $self->{sessionUserName} = $self->{weblisketSession}->getUserName();
        $self->{role} = $self->{weblisketSession}->getRole();
        $self->{attemptsInteger} = $self->{weblisketSession}->getAttempts();
        $self->{timeout} = $self->{weblisketSession}->getTimeout();
}


# throws Exception
sub invalidateSession {
    my ($self) = @_;
        try {
            $self->{weblisketSession}->clear();
            return $javax::servlet::jsp::tagext::TagSupport::EVAL_BODY_INCLUDE;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATIONERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "invalidateSession()", $e);
            }
            return undef;
        }
}


sub isSessionOld {
    my ($self) = @_;
        if (defined($self->{role})) {
            my $timeCreated = $self->{weblisketSession}->getCreationTime();
            my $sessionTimout = $self->{role}->getSessionTimeout();
            my $calendar = 'java::util::Calendar'->getInstance();
            my $timeFirst = $calendar->getTimeInMillis() - $sessionTimout;
            if ($timeFirst > $timeCreated) {
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
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
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                $self->{logUtil}->putF("Role Is Not In Session", $self, "isSessionOld()");
            }
        }
        return $self->isRarelyUsedSession();
}


sub isRarelyUsedSession {
    my ($self) = @_;
        if (defined($self->{role})) {
            my $timeCreated = $self->{weblisketSession}->getCreationTime();
            my $lastAccess = $self->{weblisketSession}->getLastAccessedTime();
            my $inactivityAllowed = $self->{role}->getSessionInactivityTimeout();
            my $calendar = 'java::util::Calendar'->getInstance();
            my $timeFirst = $calendar->getTimeInMillis() - $lastAccess;
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Session Is Rarely Used - Timeout: ");
                $stringBuffer->appendlong($lastAccess);
                $stringBuffer->append(" Eval: ");
                $stringBuffer->appendlong($timeFirst);
                $stringBuffer->append(" > ");
                $stringBuffer->appendlong($inactivityAllowed);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "isRarelyUsedSession()");
            }
        } else {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                $self->{logUtil}->putF("Role Is Not In Session", $self, "isRarelyUsedSession()");
            }
        }
        return 0;
}


sub validRole {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Trying New login<p/>");
            return $stringBuffer->toString();
        } catch ($e) {
            my $error = "Failed to set valid role";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATIONERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "validRole()", $e);
            }
            return $error;
        }
}


sub invalidRole {
    my ($self) = @_;
        try {
            $self->{weblisketSession}->setAuthenticated(0);
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Sorry your username and password is invalid on this page. ");
            $stringBuffer->append("Trying New login<p/>");
            return $stringBuffer->toString();
        } catch ($e) {
            my $error = "Failed to set role invalid";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATIONERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "invalidRole()", $e);
            }
            return $error;
        }
}


# throws Exception
sub isAuthenticated {
    my ($self) = @_;
        if ('org::allbinary::logic::java::bool::BooleanUtil'->getInstance()->getFromString($self->{authenticated})) {
            return 1;
        } else {
            return 0;
        }
}


sub isAuthenticationSessionValid {
    my ($self, $roles) = @_;
        try {
            if (defined($self->{role})) {
                if ($self->isAuthenticated()) {
                    if (defined($self->{sessionUserName})) {
                        my $basicUserRole = $self->{role}->getBasicUserRole();
                        my $basicUserRoleArray = $roles->toArray();
                        my $size = scalar(@{$basicUserRoleArray});
                        for (my $index = 0; $index < $size; $index++) {
                            my $mustBeOfRole = $basicUserRoleArray->[$index];
                            if ($basicUserRole->equals($mustBeOfRole)) {
                                if ($basicUserRole->equals('org::allbinary::business::user::role::UserRoleFactory'->getInstance()->{CUSTOMER})) {
                                    my $userEntityInterface = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance();
                                    my $userInterface = $userEntityInterface->getUser($self->{sessionUserName});
                                    if (!$userInterface->isSessionValid()) {
                                        return 0;
                                    }
                                }
                                return 1;
                            }
                        }
                    }
                    return 0;
                }
            } else {
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATION})) {
                    $self->{logUtil}->putF("Role Is Not In Session", $self, "isAuthenticationSessionValid()");
                }
            }
            return 0;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATIONERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "isAuthenticatedSessionValid()", $e);
            }
            return 0;
        }
}


sub nextAttempt {
    my ($self) = @_;
        if (defined($self->{attemptsInteger}) && int($self->{attemptsInteger}) > 0) {
            $self->{weblisketSession}->setAttempts(int($self->{attemptsInteger}) + 1);
        } else {
            $self->{weblisketSession}->setAttempts(1);
        }
}


sub processIfNewLogin {
    my ($self, $userName, $password) = @_;
        try {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATIONERROR})) {
                $self->{logUtil}->putF("Starting: " . $userName, $self, "processIfNewLogin()");
            }
            if (defined($userName) && ($userName cmp 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) != 0 && defined($password) && ($password cmp 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) != 0) {
                my $login = undef;
                my $userEntityInterface = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance();
                $login = $userEntityInterface->login($userName, $password);
                if (($login cmp $org::allbinary::globals::GLOBALS2::LOGINSUCCESS) == 0) {
                    my $userInterface = $userEntityInterface->getUser($userName);
                    if ($userInterface->isSessionValid()) {
                        $self->{weblisketSession}->setAttempts(0);
                        return 1;
                    }
                }
                $self->nextAttempt();
                return 0;
            }
            $self->nextAttempt();
            return 0;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATIONERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processIfNewLogin()", $e);
            }
            return 0;
        }
}


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
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{AUTHENTICATIONERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "processInvalidation()", $e);
            }
            return 0;
        }
}


sub outputSessionInfo {
    my ($self) = @_;
        try {
            my $calendar = 'java::util::Calendar'->getInstance();
            my $timeCreated = $self->{weblisketSession}->getCreationTime();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $lastAccess = $self->{weblisketSession}->getLastAccessedTime();
            $stringBuffer->append("Time Since Last Access: " . ($calendar->getTimeInMillis() - $lastAccess) . "<br/>\n");
            if (defined($self->{role})) {
                $stringBuffer->append("Auth: ");
                $stringBuffer->append($self->{authenticated});
                $stringBuffer->append(" UserName: ");
                $stringBuffer->append($self->{sessionUserName});
                $stringBuffer->append(" Role: ");
                $stringBuffer->append($self->{role}->toString());
                $stringBuffer->append("<br/>\n");
                $stringBuffer->append("Time Left: ");
                $stringBuffer->appendlong(int(($self->{role}->getSessionTimeout() - ($calendar->getTimeInMillis() - $timeCreated))));
                $stringBuffer->append("<br/>\n");
                $stringBuffer->append("Inactivity Time Allowed: ");
                $stringBuffer->appendlong(int($self->{role}->getSessionTimeout()));
                $stringBuffer->append("<br/>\n");
                $stringBuffer->append("Inactivity Time Allowed: ");
                $stringBuffer->appendlong(int($self->{role}->getSessionInactivityTimeout()));
                $stringBuffer->append("<br/>\n");
            } else {
                $stringBuffer->append("Role Is Not Set<br/>\n");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            return "Error";
        }
}


sub getRole {
    my ($self) = @_;
        return $self->{role};
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
# use javax::servlet::jsp::tagext::TagSupport;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::role::BasicUserRole;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::business::user::role::UserRoleFactory;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::data::tables::user::UserEntityInterface;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::java::bool::BooleanUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use admin::taghelpers::TagHelper;

1;

