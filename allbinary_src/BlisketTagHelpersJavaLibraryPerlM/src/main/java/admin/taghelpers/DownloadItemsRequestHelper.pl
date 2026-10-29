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

package admin::taghelpers::DownloadItemsRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::ModifyTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{downloadableItem} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $inventoryTag = $hashMap->get($admin::tags::AbTagData::PARENT);
        my $inventoryItemViewParentTagHelper = 'admin::taghelpers::InventoryItemViewParentTagHelper'->getInstance();
        my $downloadableInventoryItemView = $inventoryItemViewParentTagHelper->getDownloadableInventoryItemView($inventoryTag);
        $self->{downloadableItem} = $downloadableInventoryItemView->getDownloadableItem();
    return $self;
}


sub insert {
    my ($self) = @_;
        try {
            my $vector = $self->{downloadableItem}->toVector();
            'org::allbinary::data::tables::user::commerce::inventory::item::downloads::DownloadItemsEntityFactory'->getInstance()->getDownloadItemsEntityInstance()->insert($vector);
            my $success = "Successfully inserted " . $self->{downloadableItem}->getId() . " into downloaditems table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "insert()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to insert " . $self->{downloadableItem}->getId() . " into downloaditems table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "inserts()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        try {
            'org::allbinary::data::tables::user::commerce::inventory::item::downloads::DownloadItemsEntityFactory'->getInstance()->getDownloadItemsEntityInstance()->delete($self->{downloadableItem}->getId());
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
            my $values = $self->{downloadableItem}->toHashMap();
            'org::allbinary::data::tables::user::commerce::inventory::item::downloads::DownloadItemsEntityFactory'->getInstance()->getDownloadItemsEntityInstance()->update($values);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($self->{downloadableItem}->getId() + 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE} . $success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to update: " . $self->{downloadableItem}->getId();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use admin::tags::AbTagData;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem;
use org::allbinary::data::tables::user::commerce::inventory::item::downloads::DownloadItemsEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonSeps;
use tags::HelperTag;
use views::admin::inventory::download::DownloadableInventoryItemView;
use admin::taghelpers::ModifyTable;
use admin::taghelpers::InventoryItemViewParentTagHelper;

1;

