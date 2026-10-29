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

package org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{downloadableItem} = undef;
}


sub new {
    my ($class, $downloadableItem) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{downloadableItem} = $downloadableItem;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        if ($org::allbinary::business::user::commerce::inventory::item::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "toXmlNode");
        }
        my $hashMap = $self->{downloadableItem}->toHashMap();
        my $totalTime = int($self->{downloadableItem}->getValidTime());
        my $calendar = 'java::util::Calendar'->getInstance();
        my $year = $calendar->get($java::util::Calendar::YEAR);
        my $month = $calendar->get($java::util::Calendar::MONTH);
        my $day = $calendar->get($java::util::Calendar::DAY_OF_MONTH);
        my $hour = $calendar->get($java::util::Calendar::HOUR);
        my $minute = $calendar->get($java::util::Calendar::MINUTE);
        my $second = $calendar->get($java::util::Calendar::SECOND);
        $calendar->setTimeInMillis($calendar->getTimeInMillis() + $totalTime);
        my $yearDelta = $calendar->get($java::util::Calendar::YEAR);
        my $monthDelta = $calendar->get($java::util::Calendar::MONTH);
        my $dayDelta = $calendar->get($java::util::Calendar::DAY_OF_MONTH);
        my $hourDelta = $calendar->get($java::util::Calendar::HOUR);
        my $minuteDelta = $calendar->get($java::util::Calendar::MINUTE);
        my $secondDelta = $calendar->get($java::util::Calendar::SECOND);
        $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_YEARS, ("" . ($yearDelta - $year)));
        $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_MONTHS, ("" . ($monthDelta - $month)));
        $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_DAYS, ("" . ($dayDelta - $day)));
        $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_HOURS, ("" . ($hourDelta - $hour)));
        $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_MINUTES, ("" . ($minuteDelta - $minute)));
        $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::VALID_TIME_SECONDS, ("" . ($secondDelta - $second)));
        my $keySet = $hashMap->keySet();
        my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::NAME);
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $nameArray = $keySet->toArray();
        my $size = scalar(@{$nameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $name = $nameArray->[$index];
            my $value = $hashMap->get($name);
            $value = $stringUtil->getNonNull($value);
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
        }
        return $node;
}


sub toXmlDoc {
    my ($self) = @_;
        return undef;
}


sub view {
    my ($self) = @_;
        return undef;
}

use java::util::Calendar;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData;

1;

