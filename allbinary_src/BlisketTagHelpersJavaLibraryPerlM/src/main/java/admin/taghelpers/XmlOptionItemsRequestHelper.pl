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

package admin::taghelpers::XmlOptionItemsRequestHelper;
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
    $self->{xmlFileStatus} = undef;
    $self->{optionXmlFile} = undef;
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
        $self->{id} = $self->{request}->getParameter($self->{basicItemData}->{ID});
        $self->{xmlFileStatus} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::XmlOptionItemData::XML_FILE_STATUS);
        $self->{optionXmlFile} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::item::option::XmlOptionItemData::OPTION_XML_FILE);
        $self->{timeEntered} = $self->{request}->getParameter('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $self->{lastModified} = $self->{request}->getParameter('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
}


sub getHashMap {
    my ($self) = @_;
        my $values = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $values->put($self->{basicItemData}->{ID}, $self->{id});
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::XmlOptionItemData::XML_FILE_STATUS, $self->{xmlFileStatus});
        $values->put($org::allbinary::business::user::commerce::inventory::item::option::XmlOptionItemData::OPTION_XML_FILE, $self->{optionXmlFile});
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
            $values->add($self->{xmlFileStatus});
            $values->add($self->{optionXmlFile});
            $values->add($time);
            $values->add($time);
            'org::allbinary::data::tables::user::commerce::inventory::item::options::XmlOptionItemsEntityFactory'->getInstance()->getXmlOptionItemsEntityInstance()->insert($values);
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
            'org::allbinary::data::tables::user::commerce::inventory::item::options::XmlOptionItemsEntityFactory'->getInstance()->getXmlOptionItemsEntityInstance()->delete($self->{id});
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
            my $success = "Update Successful";
            my $values = $self->getHashMap();
            'org::allbinary::data::tables::user::commerce::inventory::item::options::XmlOptionItemsEntityFactory'->getInstance()->getXmlOptionItemsEntityInstance()->update($values);
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
use org::allbinary::business::user::commerce::inventory::item::option::XmlOptionItemData;
use org::allbinary::data::tables::user::commerce::inventory::item::options::XmlOptionItemsEntityFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use admin::taghelpers::ModifyTable;

1;

