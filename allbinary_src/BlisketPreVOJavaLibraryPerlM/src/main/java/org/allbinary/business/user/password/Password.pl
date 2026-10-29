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

package org::allbinary::business::user::password::Password;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{password} = undef;
}


sub new {
    my ($class, $password) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{password} = $password;
    return $self;
}


sub set {
    my ($self, $value) = @_;
        $self->{password} = $value;
}


sub get {
    my ($self) = @_;
        return $self->{password};
}


sub isValid {
    my ($self) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $valid = 1;
            if ($org::allbinary::business::user::password::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::password::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VALIDATION})) {
                $self->{logUtil}->putF("Password: " . $self->{password}, $self, $commonStrings->{IS_VALID});
            }
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{password}, 6, $org::allbinary::business::user::UserData::MAXLEN)) {
                if ($org::allbinary::business::user::password::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::password::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VALIDATION})) {
                    $self->{logUtil}->putF("Password is invalid", $self, $commonStrings->{IS_VALID});
                }
                $valid = 0;
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::business::user::password::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::password::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VALIDATIONERROR})) {
                $self->{logUtil}->put("Failed to validate form", "Password", $commonStrings->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub getValidationInfo {
    my ($self) = @_;
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($self->{password}, 6, $org::allbinary::business::user::UserData::MAXLEN)) {
            return "Please enter a Password with more than 6 characters.<br />";
        }
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        return $stringUtil->{EMPTY_STRING};
}


sub toVector {
    my ($self, $secret) = @_;
        $self->{password} = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($self->{password});
        my $random = 'java::util::Random'->new()->nextInt($org::allbinary::logic::control::crypt::SuperCrypt::KEYMAX);
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($random->toString());
        $vector->add($secret);
        $vector->add('org::allbinary::logic::control::crypt::SuperCrypt'->new($random)->encrypt($self->{password}));
        return $vector;
}


sub toHashMap {
    my ($self, $secret) = @_;
        $self->{password} = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($self->{password});
        my $values = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $random = 'java::util::Random'->new()->nextInt($org::allbinary::logic::control::crypt::SuperCrypt::KEYMAX);
        $values->put('org::allbinary::business::entry::EntryData'->getInstance()->{ENCRYPTION}, $random->toString());
        $values->put($org::allbinary::business::user::UserData::SECRET, $secret);
        $values->put($org::allbinary::business::user::UserData::PASSWORD, 'org::allbinary::logic::control::crypt::SuperCrypt'->new($random)->encrypt($self->{password}));
        return $values;
}

use java::util::HashMap;
use java::util::Random;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::UserData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::SuperCrypt;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;

1;

