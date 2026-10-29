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

package org::allbinary::logic::system::security::licensing::AbeClientLicense;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'org::allbinary::logic::system::security::licensing::AbeLicenseInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{hashtable} = undef;
    $self->{id} = undef;
    $self->{servers} = undef;
    $self->{special} = undef;
    $self->{licenseType} = undef;
}


sub new {
    my ($class, $hashtable) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        my $abeClientInformationData = 'org::allbinary::logic::system::security::licensing::AbeClientInformationData'->getInstance();
        my $keyValue = $hashtable->get($abeClientInformationData->{KEY});
        if (defined($keyValue)) {
            if ((Scalar::Util::blessed($keyValue) && $keyValue->isa('String'))) {
                $self->{hashtable}->put($abeClientInformationData->{KEY}, $keyValue);
            }
        }
        $self->{id} = $hashtable->get($abeClientInformationData->{LICENSEID});
        my $vector = $hashtable->get($abeClientInformationData->{LICENSESERVERS});
        $self->{servers} = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            $self->{servers}->add($vector->get($index));
        }
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->setSpecial($stringUtil->getNonNull($hashtable->get($abeClientInformationData->{SPECIAL})));
        my $licenseTypeString = $stringUtil->getNonNull($hashtable->get($abeClientInformationData->{LICENSE_TYPE}));
        $self->{licenseType} = 'org::allbinary::logic::system::security::licensing::LicenseTypeFactory'->getInstance()->getInstance($licenseTypeString);
    return $self;
}


sub hasRequiredKeys {
    my ($class, $resultHashtable) = @_;
        my $abeClientInformationData = 'org::allbinary::logic::system::security::licensing::AbeClientInformationData'->getInstance();
        if ($resultHashtable->containsKey($abeClientInformationData->{LICENSEID}) && $resultHashtable->containsKey($abeClientInformationData->{LICENSESERVERS}) && $resultHashtable->containsKey($abeClientInformationData->{KEY}) && $resultHashtable->containsKey($abeClientInformationData->{LICENSE_TYPE})) {
            return 1;
        } else {
            return 0;
        }
}


sub hasKey {
    my ($self) = @_;
        return $self->isValid();
}


sub getKey {
    my ($self, $keyName) = @_;
        return $self->{hashtable}->get($keyName);
}


sub getLicenseId {
    my ($self) = @_;
        return $self->{id};
}


sub getServers {
    my ($self) = @_;
        return $self->{servers};
}


sub isValid {
    my ($self) = @_;
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isEmpty($self->getKey('org::allbinary::logic::system::security::licensing::AbeClientInformationData'->getInstance()->{KEY}))) {
            return 1;
        }
        return 0;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $BREAK = "<br/>";
        $stringBuffer->append("License Id: ");
        $stringBuffer->append($self->getLicenseId());
        $stringBuffer->append($BREAK);
        $stringBuffer->append("Is Valid: ");
        $stringBuffer->appendboolean($self->isValid());
        $stringBuffer->append($BREAK);
        $stringBuffer->append("Keys: ");
        $stringBuffer->append($self->{hashtable}->toString());
        $stringBuffer->append($BREAK);
        my $serverVector = $self->getServers();
        my $size = $serverVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $nextServerString = $serverVector->get($index);
            $stringBuffer->append("Server: ");
            $stringBuffer->append($nextServerString);
            $stringBuffer->append($BREAK);
        }
        return $stringBuffer->toString();
}


sub setSpecial {
    my ($self, $special) = @_;
        $self->{special} = $special;
}


sub getSpecial {
    my ($self) = @_;
        return $self->{special};
}


sub getLicenseType {
    my ($self) = @_;
        return $self->{licenseType};
}

use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::system::security::licensing::AbeLicenseInterface;
use org::allbinary::logic::system::security::licensing::AbeClientInformationData;
use org::allbinary::logic::system::security::licensing::LicenseTypeFactory;

1;

