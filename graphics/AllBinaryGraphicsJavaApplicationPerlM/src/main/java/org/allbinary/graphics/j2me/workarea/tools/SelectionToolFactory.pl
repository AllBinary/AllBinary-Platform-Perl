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

package org::allbinary::graphics::j2me::workarea::tools::SelectionToolFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::j2me::workarea::tools::GraphicsItemInterfaceFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $canvasJPanel) = @_;
        return 'org::allbinary::graphics::j2me::workarea::tools::SelectionTool'->new($canvasJPanel);
}

use org::allbinary::graphics::j2me::workarea::canvas::CanvasJPanel;
use org::allbinary::graphics::j2me::workarea::tools::GraphicsItemInterfaceFactoryInterface;
use org::allbinary::graphics::j2me::workarea::tools::SelectionTool;

1;

