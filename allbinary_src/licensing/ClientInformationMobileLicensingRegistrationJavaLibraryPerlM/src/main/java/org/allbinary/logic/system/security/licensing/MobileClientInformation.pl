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

package org::allbinary::logic::system::security::licensing::MobileClientInformation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::AbeClientInformation';

our $DESC = "Mobile";
our $ANDROID_DESC = "Android" . $org::allbinary::logic::system::security::licensing::MobileClientInformation::DESC;


sub new {
    my ($class, $name, $version, $specialName, $shortName) = @_;
    my $self = $class->SUPER::new($name, $version, 'org::allbinary::logic::string::StringMaker'->new()->append($specialName)->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append('org::allbinary::logic::system::security::licensing::PartnerIdentifierFileUtil'->getInstance()->get())->toString(), $shortName);
        # super(...) made $self above
        my $string = $self->getSpecialName();
        my $number = substr($string, length($string) - 1);
        if (!defined('Integer'->getInteger($number))) {
            $self->setHardSale(0);
        }
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        if ($self->isHardSale()) {
            $self->{logUtil}->putF("Use Hard Coded Selling", $self, $commonStrings->{CONSTRUCTOR});
        } else {
            $self->{logUtil}->putF("Don't Use Hard Coded Selling", $self, $commonStrings->{CONSTRUCTOR});
        }
    return $self;
}


sub toHashtable {
    my ($self) = @_;
        my $hashtable = $self->SUPER::toHashtable();
        my $registrationConfiguration = 'org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration'->getInstance();
        $hashtable->put($registrationConfiguration->{NAME}, $registrationConfiguration->getRegistrationCode());
        return $hashtable;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::logic::system::security::licensing::AbeClientInformation;
use org::allbinary::logic::system::security::licensing::PartnerIdentifierFileUtil;

1;

