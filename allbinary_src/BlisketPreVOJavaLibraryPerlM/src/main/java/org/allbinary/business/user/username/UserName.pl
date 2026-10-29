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

package org::allbinary::business::user::username::UserName;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::username::UserName'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{userName} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserName takes " . scalar(@arguments) . " arguments";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::username::UserName::instance;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userName} = $hashMap->get($org::allbinary::business::user::UserData::USERNAME);
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            return $self->isValid($self->{userName});
        } catch ($e) {
            if ($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, "isUserNameValid()", $e);
            }
            return 0;
        }
}


sub get {
    my ($self) = @_;
        return $self->{userName};
}


# Java overloaded method: Perl keeps the last definition
sub isValid {
    my ($self, $aUserName) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $booleanFactory = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
            my $valid = $booleanFactory->{TRUE};
            if ($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VALIDATION})) {
                $self->{logUtil}->putF("UserName: " . $aUserName, $self, $commonStrings->{IS_VALID});
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($aUserName, 5, $org::allbinary::business::user::UserData::MAXLEN)) {
                if ($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VALIDATION})) {
                    $self->{logUtil}->putF("UserName is invalid", $self, $commonStrings->{IS_VALID});
                }
                $valid = $booleanFactory->{FALSE};
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::username::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $commonStrings->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub getValidationInfo {
    my ($class, $aUserName) = @_;
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($aUserName, 5, $org::allbinary::business::user::UserData::MAXLEN)) {
            return "Please enter a User Name with more than 5 characters.<br/>";
        }
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

use java::util::HashMap;
use org::allbinary::business::user::UserData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;

1;

