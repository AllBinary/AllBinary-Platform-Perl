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

package org::allbinary::graphics::j2me::workarea::tools::GraphicItemBuilder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $node) = @_;
        my $graphicItemName = $node->getNodeName();
        if (($graphicItemName cmp 'org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil'->getInstance()->{LINES}) == 0) {
            return 'org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->new($node);
        } else {
            die ("Graphic Item Does Not Exist: " . $graphicItemName);
        }
}

use org::w3c::dom::Node;
use org::allbinary::graphics::j2me::workarea::tools::PointsDomUtil;
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;

1;

