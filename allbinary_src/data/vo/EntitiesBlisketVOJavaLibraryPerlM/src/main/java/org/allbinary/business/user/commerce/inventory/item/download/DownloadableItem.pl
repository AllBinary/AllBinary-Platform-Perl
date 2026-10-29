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

package org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
    $self->{basicItemId} = undef;
    $self->{enabled} = undef;
    $self->{system} = undef;
    $self->{platform} = undef;
    $self->{specialName} = undef;
    $self->{version} = undef;
    $self->{changes} = undef;
    $self->{licenseFile} = undef;
    $self->{file} = undef;
    $self->{size} = undef;
    $self->{validTime} = undef;
    $self->{retries} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of DownloadableItem takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $id) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        $self->{id} = 'org::allbinary::data::generator::ProductIdGenerator'->new()->getNext();
        $self->{basicItemId} = $id;
        $self->{enabled} = 'org::allbinary::business::entry::EntryData'->getInstance()->{YES};
        $self->{system} = "Java";
        $self->{platform} = "Android";
        $self->{specialName} = $EMPTY_STRING;
        $self->{version} = $EMPTY_STRING;
        $self->{changes} = $EMPTY_STRING;
        $self->{licenseFile} = $EMPTY_STRING;
        $self->{file} = $EMPTY_STRING;
        $self->{size} = ("" . (0));
        $self->{validTime} = ("" . (0));
        $self->{retries} = $EMPTY_STRING;
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{id} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID);
        $self->{basicItemId} = $hashMap->get('org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance()->{ID});
        $self->{enabled} = $hashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE});
        $self->{system} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SYSTEM);
        $self->{platform} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::PLATFORM);
        $self->{specialName} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SPECIAL_NAME);
        $self->{version} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VERSION);
        $self->{changes} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::CHANGES);
        $self->{licenseFile} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE);
        $self->{file} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE);
        my $value = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SIZE);
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($value)) {
            $self->{size} = ("" . ($value));
        } else {
            $self->{size} = 0;
        }
        my $validTime = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME);
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($validTime)) {
            $self->{validTime} = ("" . ($validTime));
        } else {
            my $totalYears = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_YEARS);
            my $totalMonths = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_MONTHS);
            my $totalDays = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_DAYS);
            my $totalHours = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_HOURS);
            my $totalMinutes = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_MINUTES);
            my $totalSeconds = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_SECONDS);
            my $totalTime = 'org::allbinary::time::TimeUtil'->getInstance()->getTotalTime($totalYears, $totalMonths, $totalDays, $totalHours, $totalMinutes, $totalSeconds);
            $self->{validTime} = $totalTime;
        }
        $self->{retries} = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::RETRIES);
    return $self;
}


sub toVector {
    my ($self) = @_;
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = $calendar->getTimeInMillis()->toString();
        my $values = 'org::allbinary::util::BasicArrayListD'->new();
        $values->add($self->getId());
        $values->add($self->{basicItemId});
        $values->add($self->{enabled});
        $values->add($self->getSpecialName());
        $values->add($self->getVersion());
        $values->add($self->getChanges());
        $values->add($self->getSystem());
        $values->add($self->getPlatform());
        $values->add($self->getLicenseFile());
        $values->add($self->getFile());
        $values->add($self->getSize()->toString());
        $values->add($self->getValidTime()->toString());
        $values->add($self->getRetries());
        $values->add($time);
        $values->add($time);
        return $values;
}


sub toHashMap {
    my ($self) = @_;
        my $values = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::ID, $self->getId());
        $values->put('org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance()->{ID}, $self->{basicItemId});
        $values->put('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE}, $self->{enabled});
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SYSTEM, $self->getSystem());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::PLATFORM, $self->getPlatform());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SPECIAL_NAME, $self->getSpecialName());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VERSION, $self->getVersion());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::CHANGES, $self->getChanges());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE, $self->getLicenseFile());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE, $self->getFile());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SIZE, $self->getSize()->toString());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME, $self->getValidTime()->toString());
        $values->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::RETRIES, $self->getRetries());
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $values->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        return $values;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub getSystem {
    my ($self) = @_;
        return $self->{system};
}


sub getPlatform {
    my ($self) = @_;
        return $self->{platform};
}


sub getSpecialName {
    my ($self) = @_;
        return $self->{specialName};
}


sub getVersion {
    my ($self) = @_;
        return $self->{version};
}


sub getChanges {
    my ($self) = @_;
        return $self->{changes};
}


sub getLicenseFile {
    my ($self) = @_;
        return $self->{licenseFile};
}


sub getFile {
    my ($self) = @_;
        return $self->{file};
}


sub getSize {
    my ($self) = @_;
        return $self->{size};
}


sub getValidTime {
    my ($self) = @_;
        return $self->{validTime};
}


sub getRetries {
    my ($self) = @_;
        return $self->{retries};
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::data::generator::ProductIdGenerator;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::time::TimeUtil;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData;

1;

