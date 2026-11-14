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

package org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

our $capitalEventHandlerArray = [(undef) x (10)];

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


{ # Java static initializer
        for (my $index = scalar(@{$org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory::capitalEventHandlerArray}) - 1; $index >= 0; $index--) {
            $org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory::capitalEventHandlerArray->[$index] = 'org::allbinary::game::layer::capital::event::CapitalEventHandler'->new();
        }
}


sub getInstance {
    my ($class, $groupInterface) = @_;
        my $groupId = int($groupInterface->getGroupId());
        return $org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory::capitalEventHandlerArray->[$groupId];
}


sub removeAll {
    my ($class) = @_;
        for (my $index = scalar(@{$org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory::capitalEventHandlerArray}) - 1; $index >= 0; $index--) {
            $org::allbinary::game::layer::capital::event::CapitalEventHandlerFactory::capitalEventHandlerArray->[$index]->removeAllListeners();
        }
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::identification::Group ();
use org::allbinary::game::layer::capital::event::CapitalEventHandler ();

1;

