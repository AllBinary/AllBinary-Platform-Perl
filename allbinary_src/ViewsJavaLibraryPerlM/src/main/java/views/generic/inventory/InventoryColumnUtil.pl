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

package views::generic::inventory::InventoryColumnUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'views::generic::inventory::InventoryColumnUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $views::generic::inventory::InventoryColumnUtil::instance;
}


sub getColumnWhereLike {
    my ($self, $inventoryEntity, $category, $column) = @_;
        $self->{logUtil}->putF("Start Category: " . $category, $self, "getKeywords");
        my $keywords = 'org::allbinary::util::BasicArrayListD'->new();
        my $vectorOfHashMaps = $inventoryEntity->getAllRows();
        my $size = $vectorOfHashMaps->size();
        for (my $index = 0; $index < $size; $index++) {
            my $hashMap = $vectorOfHashMaps->get($index);
            my $categoryName = $hashMap->get($self->{basicItemData}->{CATEGORY});
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($categoryName) && (index($categoryName, $category) == 0)) {
                $keywords->add($hashMap->get($column));
            }
        }
        return $keywords;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;

1;

