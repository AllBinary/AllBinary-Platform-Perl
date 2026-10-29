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

package admin::taghelpers::BasicOptionItemsRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::ModifyTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{request} = undef;
    $self->{id} = undef;
    $self->{optionOneTitle} = undef;
    $self->{defaultOptionItem} = undef;
    $self->{defaultOptionValue} = undef;
    $self->{optionItem} = undef;
    $self->{optionValue} = undef;
    $self->{timeEntered} = undef;
    $self->{lastModified} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{request} = $pageContext->getRequest();
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{optionItem} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{optionValue} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{id} = $self->{request}->getParameter($self->{basicItemData}->{ID});
        $self->{optionOneTitle} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_TITLE);
        $self->{defaultOptionItem} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::DEFAULT_OPTION_ITEM);
        $self->{defaultOptionValue} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::DEFAULT_OPTION_VALUE);
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_ONE_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_ONE_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_TWO_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_TWO_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_THREE_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_THREE_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FOUR_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FOUR_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FIVE_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FIVE_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SIX_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SIX_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SEVEN_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SEVEN_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_EIGHT_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_EIGHT_VALUE));
        $self->{optionItem}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_NINE_ITEM));
        $self->{optionValue}->add($self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_NINE_VALUE));
        $self->{timeEntered} = $self->{request}->getParameter('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $self->{lastModified} = $self->{request}->getParameter('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
}


sub getHashMap {
    my ($self) = @_;
        my $values = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $values->put($self->{basicItemData}->{ID}, $self->{id});
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_ONE_ITEM, $self->{optionItem}->get(0));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_ONE_VALUE, $self->{optionValue}->get(0));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_TWO_ITEM, $self->{optionItem}->get(1));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_TWO_VALUE, $self->{optionValue}->get(1));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_THREE_ITEM, $self->{optionItem}->get(2));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_THREE_VALUE, $self->{optionValue}->get(2));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FOUR_ITEM, $self->{optionItem}->get(3));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FOUR_VALUE, $self->{optionValue}->get(3));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FIVE_ITEM, $self->{optionItem}->get(4));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_FIVE_VALUE, $self->{optionValue}->get(4));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SIX_ITEM, $self->{optionItem}->get(5));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SIX_VALUE, $self->{optionValue}->get(5));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SEVEN_ITEM, $self->{optionItem}->get(6));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_SEVEN_VALUE, $self->{optionValue}->get(6));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_EIGHT_ITEM, $self->{optionItem}->get(7));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_EIGHT_VALUE, $self->{optionValue}->get(7));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_NINE_ITEM, $self->{optionItem}->get(8));
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData::OPTION_ONE_NINE_VALUE, $self->{optionValue}->get(8));
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $values->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        return $values;
}


sub insert {
    my ($self) = @_;
        try {
            my $calendar = 'java::util::Calendar'->getInstance();
            my $time = ("" . $calendar->getTimeInMillis()->toString());
            my $values = 'org::allbinary::util::BasicArrayListD'->new();
            $values->add($self->{id});
            my $size = $self->{optionValue}->size();
            for (my $index = 0; $index < $size; $index++) {
                $values->add($self->{optionValue}->get($index));
                $values->add($self->{optionItem}->get($index));
            }
            $values->add($time);
            $values->add($time);
            'org::allbinary::data::tables::user::commerce::inventory::item::options::BasicOptionItemsEntityFactory'->getInstance()->getBasicOptionItemsEntityInstance()->insert($values);
            my $success = "Successfully inserted " . $self->{id} . " into items table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "insert()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to insert " . $self->{id} . " into items table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "inserts()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        try {
            'org::allbinary::data::tables::user::commerce::inventory::item::options::BasicOptionItemsEntityFactory'->getInstance()->getBasicOptionItemsEntityInstance()->delete($self->{id});
            my $success = "Successfully deleted";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "delete()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to delete";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e);
            }
            return $error;
        }
}


sub update {
    my ($self) = @_;
        try {
            my $success = "Update Pricing Successful";
            my $values = $self->getHashMap();
            'org::allbinary::data::tables::user::commerce::inventory::item::options::BasicOptionItemsEntityFactory'->getInstance()->getBasicOptionItemsEntityInstance()->update($values);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{id})->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($success)->toString(), $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to update: " . $self->{id};
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::option::BasicOptionItemData;
use org::allbinary::data::tables::user::commerce::inventory::item::options::BasicOptionItemsEntityFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use admin::taghelpers::ModifyTable;

1;

