# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::input::SelectRTSLayerVisitorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::SelectRTSLayerVisitorFactoryInterface';

our $instance = 'org::allbinary::game::input::SelectRTSLayerVisitorFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::SelectRTSLayerVisitorFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub create {
    my ($self, $selectedRTSLayersPlayerGameInput) = @_;
        return 'org::allbinary::game::input::SelectRTSLayerVisitor'->new();
}

use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::game::input::SelectRTSLayerVisitorFactoryInterface;
use org::allbinary::game::input::SelectRTSLayerVisitor;

1;

