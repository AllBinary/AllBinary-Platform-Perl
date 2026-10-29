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

package org::allbinary::business::user::commerce::inventory::item::BasicItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::inventory::item::ItemInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{itemId} = undef;
    $self->{number} = undef;
    $self->{inBaskets} = undef;
    $self->{weight} = undef;
    $self->{enabled} = undef;
    $self->{newOrUsed} = undef;
    $self->{summary} = undef;
    $self->{distributor} = undef;
    $self->{idUsedByDistributor} = undef;
    $self->{producedBy} = undef;
    $self->{productionDate} = undef;
    $self->{startProductionDate} = undef;
    $self->{description} = undef;
    $self->{keywords} = undef;
    $self->{category} = undef;
    $self->{type} = undef;
    $self->{smallImage} = undef;
    $self->{mediumImage} = undef;
    $self->{largeImage} = undef;
    $self->{price} = undef;
    $self->{comment} = undef;
    $self->{customs} = undef;
    $self->{downloads} = undef;
    $self->{groups} = undef;
    $self->{options} = undef;
    $self->{permissions} = undef;
    $self->{specials} = undef;
    $self->{downloadable} = 0;
    $self->{timeEntered} = undef;
    $self->{lastModified} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of BasicItem takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $itemHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "Constructor(HashMap)");
        }
        $self->{itemId} = $itemHashMap->get($self->{basicItemData}->{ID});
        $self->{number} = $itemHashMap->get($self->{basicItemData}->{NUMBER});
        $self->{inBaskets} = $itemHashMap->get($self->{basicItemData}->{INBASKETS});
        $self->{weight} = $itemHashMap->get($self->{basicItemData}->{WEIGHT});
        $self->{enabled} = $itemHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE});
        $self->{newOrUsed} = $itemHashMap->get($self->{basicItemData}->{NEWORUSED});
        $self->{summary} = $itemHashMap->get($self->{basicItemData}->{SUMMARY});
        $self->{distributor} = $itemHashMap->get($self->{basicItemData}->{DISTRIBUTOR});
        $self->{idUsedByDistributor} = $itemHashMap->get($self->{basicItemData}->{IDUSEDBYDISTRIBUTOR});
        $self->{producedBy} = $itemHashMap->get($self->{basicItemData}->{PRODUCEDBY});
        $self->{productionDate} = $itemHashMap->get($self->{basicItemData}->{PRODUCTIONDATE});
        $self->{startProductionDate} = $itemHashMap->get($self->{basicItemData}->{STARTPRODUCTIONDATE});
        $self->{description} = $itemHashMap->get($self->{basicItemData}->{DESCRIPTION});
        $self->{keywords} = $itemHashMap->get($self->{basicItemData}->{KEYWORDS});
        $self->{category} = $itemHashMap->get($self->{basicItemData}->{CATEGORY});
        $self->{type} = $itemHashMap->get($self->{basicItemData}->{TYPE});
        $self->{smallImage} = $itemHashMap->get($self->{basicItemData}->{SMALLIMAGE});
        $self->{mediumImage} = $itemHashMap->get($self->{basicItemData}->{MEDIUMIMAGE});
        $self->{largeImage} = $itemHashMap->get($self->{basicItemData}->{LARGEIMAGE});
        $self->{timeEntered} = $itemHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $self->{lastModified} = $itemHashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
        $self->{price} = 'org::allbinary::business::user::commerce::money::Money'->new($itemHashMap->get($self->{basicItemData}->{PRICE}));
        $self->{comment} = $itemHashMap->get($self->{basicItemData}->{COMMENT});
        $self->{customs} = $itemHashMap->get($self->{basicItemData}->{CUSTOMS});
        $self->setDownloads($itemHashMap->get($self->{basicItemData}->{DOWNLOADS}));
        $self->{groups} = $itemHashMap->get($self->{basicItemData}->{GROUPS});
        $self->{options} = $itemHashMap->get($self->{basicItemData}->{OPTIONS});
        $self->{permissions} = $itemHashMap->get($self->{basicItemData}->{PERMISSIONS});
        $self->{specials} = $itemHashMap->get($self->{basicItemData}->{SPECIALS});
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        my $EMPTY = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        $self->{itemId} = 'org::allbinary::data::generator::ProductIdGenerator'->new()->getNext();
        $self->{number} = 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO};
        $self->{inBaskets} = $EMPTY;
        $self->{weight} = $EMPTY;
        $self->{enabled} = $EMPTY;
        $self->{newOrUsed} = $EMPTY;
        $self->{summary} = $EMPTY;
        $self->{distributor} = $EMPTY;
        $self->{idUsedByDistributor} = $EMPTY;
        $self->{producedBy} = $EMPTY;
        $self->{productionDate} = $EMPTY;
        $self->{startProductionDate} = $EMPTY;
        $self->{description} = $EMPTY;
        $self->{keywords} = $EMPTY;
        $self->{category} = $EMPTY;
        $self->{type} = $EMPTY;
        $self->{smallImage} = $EMPTY;
        $self->{mediumImage} = $EMPTY;
        $self->{largeImage} = $EMPTY;
        $self->{timeEntered} = $EMPTY;
        $self->{lastModified} = $EMPTY;
        $self->{price} = 'org::allbinary::business::user::commerce::money::Money'->new();
        $self->{comment} = $EMPTY;
        $self->{customs} = $EMPTY;
        $self->setDownloads($EMPTY);
        $self->{groups} = $EMPTY;
        $self->{options} = $EMPTY;
        $self->{permissions} = $EMPTY;
        $self->{specials} = $EMPTY;
    return $self;
}


sub setId {
    my ($self, $itemId) = @_;
        $self->{itemId} = $itemId;
}


sub setNumber {
    my ($self, $number) = @_;
        $self->{number} = $number;
}


sub setInBaskets {
    my ($self, $value) = @_;
        $self->{inBaskets} = $value;
}


sub setWeight {
    my ($self, $value) = @_;
        $self->{weight} = $value;
}


sub setNewOrUsed {
    my ($self, $value) = @_;
        $self->{newOrUsed} = $value;
}


sub setSummary {
    my ($self, $value) = @_;
        $self->{summary} = $value;
}


sub setDistributor {
    my ($self, $value) = @_;
        $self->{distributor} = $value;
}


sub setIdUsedByDistributor {
    my ($self, $value) = @_;
        $self->{idUsedByDistributor} = $value;
}


sub setProducedBy {
    my ($self, $value) = @_;
        $self->{producedBy} = $value;
}


sub setProductionDate {
    my ($self, $value) = @_;
        $self->{productionDate} = $value;
}


sub setStartProductionDate {
    my ($self, $value) = @_;
        $self->{startProductionDate} = $value;
}


sub setDescription {
    my ($self, $value) = @_;
        $self->{description} = $value;
}


sub setKeywords {
    my ($self, $value) = @_;
        $self->{keywords} = $value;
}


sub setCategory {
    my ($self, $value) = @_;
        $self->{category} = $value;
}


sub setType {
    my ($self, $value) = @_;
        $self->{type} = $value;
}


sub setSmallImage {
    my ($self, $value) = @_;
        $self->{smallImage} = $value;
}


sub setMediumImage {
    my ($self, $value) = @_;
        $self->{mediumImage} = $value;
}


sub setLargeImage {
    my ($self, $value) = @_;
        $self->{largeImage} = $value;
}


sub setTimeEntered {
    my ($self, $value) = @_;
        $self->{timeEntered} = $value;
}


sub setLastModified {
    my ($self, $value) = @_;
        $self->{lastModified} = $value;
}


sub setPrice {
    my ($self, $value) = @_;
        $self->{price} = $value;
}


sub setComment {
    my ($self, $value) = @_;
        $self->{comment} = $value;
}


sub setCustoms {
    my ($self, $value) = @_;
        $self->{customs} = $value;
}


sub setDownloads {
    my ($self, $value) = @_;
        $self->{downloads} = $value;
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{downloads})) {
            my $downloadInteger = ("" . ($self->{downloads}));
            if (int($downloadInteger) != 0) {
                $self->setDownloadable(1);
            }
        }
}


sub setGroups {
    my ($self, $value) = @_;
        $self->{groups} = $value;
}


sub setOptions {
    my ($self, $value) = @_;
        $self->{options} = $value;
}


sub setPermissions {
    my ($self, $value) = @_;
        $self->{permissions} = $value;
}


sub setSpecials {
    my ($self, $value) = @_;
        $self->{specials} = $value;
}


sub setEnabled {
    my ($self, $value) = @_;
        $self->{enabled} = $value;
}


sub getId {
    my ($self) = @_;
        return $self->{itemId};
}


sub getNumber {
    my ($self) = @_;
        return $self->{number};
}


sub getInBaskets {
    my ($self) = @_;
        return $self->{inBaskets};
}


sub getWeight {
    my ($self) = @_;
        return $self->{weight};
}


sub getNewOrUsed {
    my ($self) = @_;
        return $self->{newOrUsed};
}


sub getSummary {
    my ($self) = @_;
        return $self->{summary};
}


sub getDistributor {
    my ($self) = @_;
        return $self->{distributor};
}


sub getIdUsedByDistributor {
    my ($self) = @_;
        return $self->{idUsedByDistributor};
}


sub getProducedBy {
    my ($self) = @_;
        return $self->{producedBy};
}


sub getProductionDate {
    my ($self) = @_;
        return $self->{productionDate};
}


sub getStartProductionDate {
    my ($self) = @_;
        return $self->{startProductionDate};
}


sub getDescription {
    my ($self) = @_;
        return $self->{description};
}


sub getKeywords {
    my ($self) = @_;
        return $self->{keywords};
}


sub getCategory {
    my ($self) = @_;
        return $self->{category};
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub getSmallImage {
    my ($self) = @_;
        return $self->{smallImage};
}


sub getMediumImage {
    my ($self) = @_;
        return $self->{mediumImage};
}


sub getLargeImage {
    my ($self) = @_;
        return $self->{largeImage};
}


sub getTimeEntered {
    my ($self) = @_;
        return $self->{timeEntered};
}


sub getLastModified {
    my ($self) = @_;
        return $self->{lastModified};
}


sub getPrice {
    my ($self) = @_;
        return $self->{price};
}


sub getComment {
    my ($self) = @_;
        return $self->{comment};
}


sub getCustoms {
    my ($self) = @_;
        return $self->{customs};
}


sub getDownloads {
    my ($self) = @_;
        return $self->{downloads};
}


sub getGroups {
    my ($self) = @_;
        return $self->{groups};
}


sub getOptions {
    my ($self) = @_;
        return $self->{options};
}


sub getPermissions {
    my ($self) = @_;
        return $self->{permissions};
}


sub getSpecials {
    my ($self) = @_;
        return $self->{specials};
}


sub setDownloadable {
    my ($self, $downloadable) = @_;
        $self->{downloadable} = $downloadable;
}


sub isDownloadable {
    my ($self) = @_;
        return $self->{downloadable};
}


sub getEnabled {
    my ($self) = @_;
        return $self->{enabled};
}


sub getTotal {
    my ($self) = @_;
        my $itemTotal = 'org::allbinary::business::user::commerce::money::Money'->new($self->{price});
        $itemTotal->multiply(int($self->{number}));
        return $itemTotal;
}


sub toHashMap {
    my ($self) = @_;
        if ($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "toHashMap");
        }
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($self->{basicItemData}->{ID}, $self->{itemId});
        $hashMap->put($self->{basicItemData}->{NUMBER}, $self->{number});
        $hashMap->put($self->{basicItemData}->{INBASKETS}, $self->{inBaskets});
        $hashMap->put($self->{basicItemData}->{WEIGHT}, $self->{weight});
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE}, $self->{enabled});
        $hashMap->put($self->{basicItemData}->{NEWORUSED}, $self->{newOrUsed});
        $hashMap->put($self->{basicItemData}->{SUMMARY}, $self->{summary});
        $hashMap->put($self->{basicItemData}->{DISTRIBUTOR}, $self->{distributor});
        $hashMap->put($self->{basicItemData}->{IDUSEDBYDISTRIBUTOR}, $self->{idUsedByDistributor});
        $hashMap->put($self->{basicItemData}->{PRODUCEDBY}, $self->{producedBy});
        $hashMap->put($self->{basicItemData}->{PRODUCTIONDATE}, $self->{productionDate});
        $hashMap->put($self->{basicItemData}->{STARTPRODUCTIONDATE}, $self->{startProductionDate});
        $hashMap->put($self->{basicItemData}->{DESCRIPTION}, $self->{description});
        $hashMap->put($self->{basicItemData}->{KEYWORDS}, $self->{keywords});
        $hashMap->put($self->{basicItemData}->{CATEGORY}, $self->{category});
        $hashMap->put($self->{basicItemData}->{TYPE}, $self->{type});
        $hashMap->put($self->{basicItemData}->{SMALLIMAGE}, $self->{smallImage});
        $hashMap->put($self->{basicItemData}->{MEDIUMIMAGE}, $self->{mediumImage});
        $hashMap->put($self->{basicItemData}->{LARGEIMAGE}, $self->{largeImage});
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = $calendar->getTimeInMillis()->toString();
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        $hashMap->put($self->{basicItemData}->{PRICE}, $self->{price}->toString());
        $hashMap->put($self->{basicItemData}->{COMMENT}, $self->{comment});
        $hashMap->put($self->{basicItemData}->{CUSTOMS}, $self->{customs});
        $hashMap->put($self->{basicItemData}->{DOWNLOADS}, $self->getDownloads());
        $hashMap->put($self->{basicItemData}->{GROUPS}, $self->{groups});
        $hashMap->put($self->{basicItemData}->{OPTIONS}, $self->{options});
        $hashMap->put($self->{basicItemData}->{PERMISSIONS}, $self->{permissions});
        $hashMap->put($self->{basicItemData}->{SPECIALS}, $self->{specials});
        return $hashMap;
}


sub toVector {
    my ($self) = @_;
        if ($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "toVector");
        }
        my $values = 'org::allbinary::util::BasicArrayListD'->new();
        $values->add($self->{itemId});
        $values->add($self->{number});
        $values->add($self->{inBaskets});
        $values->add($self->{weight});
        $values->add($self->{enabled});
        $values->add($self->{newOrUsed});
        $values->add($self->{summary});
        $values->add($self->{distributor});
        $values->add($self->{idUsedByDistributor});
        $values->add($self->{producedBy});
        $values->add($self->{productionDate});
        $values->add($self->{startProductionDate});
        $values->add($self->{description});
        $values->add($self->{keywords});
        $values->add($self->{category});
        $values->add($self->{type});
        $values->add($self->getSmallImage());
        $values->add($self->getMediumImage());
        $values->add($self->getLargeImage());
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = $calendar->getTimeInMillis()->toString();
        $values->add($time);
        $values->add($time);
        $values->add($self->{price}->toString());
        $values->add($self->{comment});
        $values->add($self->{customs});
        $values->add($self->getDownloads());
        $values->add($self->{groups});
        $values->add($self->{options});
        $values->add($self->{permissions});
        $values->add($self->{specials});
        return $values;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return $self->getId();
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::data::generator::ProductIdGenerator;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;

1;

