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

package admin::taghelpers::AuthenticationRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{request} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of AuthenticationRequestHelper takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        $self->{request} = $pageContext->getRequest();
    return $self;
}


sub _new2 {
    my ($class, $hashMap, $httpServletRequest) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $httpServletRequest);
        $self->{request} = $httpServletRequest;
    return $self;
}


# throws Exception
sub generateNewPassword {
    my ($self) = @_;
        if (defined($self->{weblisketSession}) && defined($self->{weblisketSession}->getId())) {
            my $startIndex = $self->{weblisketSession}->getId()->length();
            if ($startIndex >= 8) {
                return $self->{weblisketSession}->getId()->substring($startIndex - 8);
            } else {
                die ("Error Generating New Password");
            }
        } else {
            die ("No Session Available For Generating New Password");
        }
}


sub newPassword {
    my ($self) = @_;
        try {
            my $userName = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEUSERNAME);
            my $email = $self->{request}->getParameter($org::allbinary::business::user::UserData::MAINEMAIL);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF("Generating New Password For: " . $userName, $self, "newPassword()");
            }
            my $userEntityInterface = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance();
            my $userInterface = $userEntityInterface->getUser($userName);
            if ($userInterface->getMainEmail()->compareTo($email) != 0) {
                if (defined($userInterface->getSecondaryEmail()) && $userInterface->getSecondaryEmail()->compareTo($email) != 0) {
                    if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                        $self->{logUtil}->putF("Requested Email Is Not In User Profile", $self, "newPassword()");
                    }
                    return 0;
                }
            }
            my $newPassword = $self->generateNewPassword();
            $userInterface->setPassword($newPassword);
            my $newPasswordHashMap = $userInterface->toPasswordHashMap();
            'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->update($userName, $newPasswordHashMap);
            'org::allbinary::logic::communication::smtp::email::NewPasswordEmail'->new($self->{abeClientInformation}, $userInterface, $newPassword)->process();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF("Generated New Password For: " . $userName, $self, "newPassword()");
            }
            return 1;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "newPassword()", $e);
            }
            return 0;
        }
}


sub changePassword {
    my ($self) = @_;
        try {
            my $userName = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEUSERNAME);
            my $passwordString = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEPASSWORD);
            my $newPassword = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLENEWPASSWORD);
            my $newReenteredPassword = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEREENTERNEWPASSWORD);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF("Changing Password For User: " . $userName, $self, "changePassword()");
            }
            my $password = 'org::allbinary::business::user::password::Password'->new($newPassword);
            if (!$password->isValid()) {
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                    $self->{logUtil}->putF("New Password Is Not Valid", $self, "changePassword()");
                }
                return 0;
            }
            if (($newPassword cmp $newReenteredPassword) != 0) {
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                    $self->{logUtil}->putF("New Password Fields Do Not Match", $self, "changePassword()");
                }
                return 0;
            }
            my $sessionPassword = $self->{weblisketSession}->getPassword();
            my $userEntityInterface = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance();
            my $userInterface = $userEntityInterface->getUser($userName);
            my $login = $userEntityInterface->login($userName, $passwordString);
            if (($login cmp $org::allbinary::globals::GLOBALS2::LOGINSUCCESS) == 0) {
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                    $self->{logUtil}->putF("Authentication Successful", $self, "changePassword()");
                }
                my $newPasswordHashMap = $password->toHashMap(undef);
                'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->update($userName, $newPasswordHashMap);
                'org::allbinary::logic::communication::smtp::email::NewPasswordEmail'->new($self->{abeClientInformation}, $userInterface, $newPassword)->process();
                return 1;
            }
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF("Authentication Failed", $self, "changePassword()");
            }
            return 0;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put("Authentication Failed", $self, "changePassword()", $e);
            }
            return 0;
        }
}


sub isRoleValid {
    my ($self, $userName, $password, $roles) = @_;
        try {
            my $userEntityInterface = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance();
            my $userInterface = $userEntityInterface->getUser($userName);
            if (!defined($userInterface->getRole())) {
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                    $self->{logUtil}->putF("Role is null: " . $userInterface->getRole() . " Valid Roles: " . $roles->toString(), $self, "isRoleValid()");
                }
                return 0;
            }
            my $basicUserRoleArray = $roles->toArray();
            my $size = scalar(@{$basicUserRoleArray});
            for (my $index = 0; $index < $size; $index++) {
                my $nextRole = $basicUserRoleArray->[$index];
                if ($userInterface->getRole()->getBasicUserRole()->equals($nextRole)) {
                    $userInterface->validateSession($self->{weblisketSession});
                    $self->{request}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEUSERNAME);
                    $self->{request}->removeAttribute($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEPASSWORD);
                    return 1;
                }
            }
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Role is not valid: ");
                $stringBuffer->append($userInterface->getRole()->toString());
                $stringBuffer->append(" Valid Roles: ");
                $stringBuffer->append($roles->toString());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "isRoleValid()");
            }
            return 0;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "isRoleValid()", $e);
            }
            return 0;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::password::Password;
use org::allbinary::business::user::role::BasicUserRole;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::data::tables::user::UserEntityInterface;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionData;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::email::NewPasswordEmail;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use admin::taghelpers::TagHelper;

1;

