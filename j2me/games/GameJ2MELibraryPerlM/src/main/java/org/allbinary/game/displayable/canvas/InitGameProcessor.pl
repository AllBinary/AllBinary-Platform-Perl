#
# AllBinary Open License Version 1
# Copyright (c) 2026 AllBinary
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

package org::allbinary::game::displayable::canvas::InitGameProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub _init_fields {
    my ($self) = @_;
    $self->{gameCanvas} = undef;
}


sub new {
    my ($class, $gameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{gameCanvas} = $gameCanvas;
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        if ('org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance()->isInGame()) {
            $self->{gameCanvas}->setProcessGameProcessorInit();
        }
}

use org::allbinary::canvas::Processor;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

