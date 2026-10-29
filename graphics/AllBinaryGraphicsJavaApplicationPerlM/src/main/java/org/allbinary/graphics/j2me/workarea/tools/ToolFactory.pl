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

package org::allbinary::graphics::j2me::workarea::tools::ToolFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::j2me::workarea::tools::ToolFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{selectedTool} = undef;
    $self->{tool} = undef;
    $self->{SELECTED_LABEL} = "Selected: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::ToolFactory::instance;
}


sub setSelectedTool {
    my ($self, $tool) = @_;
        try {
            'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus($self->{SELECTED_LABEL} . $tool);
            $self->{tool} = $tool;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setSelectionTool", $e);
        }
}


sub getSelectedToolFactory {
    my ($self) = @_;
        'org::allbinary::graphics::j2me::StatusFactory'->getInstance()->setStatus("Tool In Use: " . $self->{tool});
        if (defined($self->{tool})) {
            $self->{selectedTool} = 'org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory'->getInstance()->getInstance($self->{tool});
            $self->{logUtil}->putF("New Tool: " . $self->{selectedTool}, $self, "getSelectedToolFactory");
            return $self->{selectedTool};
        } else {
            return undef;
        }
}

use org::allbinary::graphics::j2me::StatusFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemFactory;

1;

