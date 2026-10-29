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

package org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{graphicItems} = undef;
    $self->{DEFAULT} = 'org::allbinary::graphics::j2me::workarea::tools::SelectionToolFactory'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{graphicItems} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{graphicItems}->put('org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->getStaticName(), 'org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItemFactory'->new());
    return $self;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $itemName) = @_;
        my $graphicsItemInterfaceFactoryInterface = $self->{graphicItems}->get($itemName);
        if (!defined($graphicsItemInterfaceFactoryInterface)) {
            $graphicsItemInterfaceFactoryInterface = $self->{DEFAULT};
        }
        return $graphicsItemInterfaceFactoryInterface;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $graphicItemNodeList) = @_;
        my $numberOfItems = $graphicItemNodeList->size();
        my $graphicItemHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        if ('org::allbinary::log::LOGGING'->contains($org::allbinary::log::LOGGING::MENUEVENT)) {
        }
        for (my $index = 0; $index < $numberOfItems; $index++) {
            my $graphicItem = 'org::allbinary::graphics::j2me::workarea::tools::GraphicItemBuilder'->getInstance($graphicItemNodeList->get($index));
            $graphicItemHashMap->put($graphicItem->getTreeNode(), $graphicItem);
        }
        return $graphicItemHashMap;
}

use java::util::HashMap;
use org::allbinary::log::LOGGING;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Node;
use org::allbinary::graphics::j2me::workarea::tools::SelectionToolFactory;
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItemFactory;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemBuilder;

1;

