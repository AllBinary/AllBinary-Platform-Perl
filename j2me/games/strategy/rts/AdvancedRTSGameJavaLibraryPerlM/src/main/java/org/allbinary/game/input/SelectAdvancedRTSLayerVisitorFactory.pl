# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::input::SelectAdvancedRTSLayerVisitorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::game::input::SelectRTSLayerVisitorFactoryInterface';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::game::input::SelectAdvancedRTSLayerVisitorFactory'->new() };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::SelectAdvancedRTSLayerVisitorFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub create {
    my ($self, $selectedRTSLayersPlayerGameInput) = @_;
        return 'org::allbinary::game::input::SelectAdvancedRTSLayerVisitor'->new($selectedRTSLayersPlayerGameInput);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::util::visitor::Visitor ();
use org::allbinary::game::input::SelectRTSLayerVisitorFactoryInterface ();
use org::allbinary::game::input::SelectAdvancedRTSLayerVisitor ();

1;

