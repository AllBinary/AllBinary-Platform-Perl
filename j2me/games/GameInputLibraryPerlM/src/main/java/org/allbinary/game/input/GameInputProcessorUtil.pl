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

package org::allbinary::game::input::GameInputProcessorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class, $inputProcessorArray) = @_;
        my $noInputProcessor = 'org::allbinary::game::input::GameInputProcessor'->getInstance();
        my $total = 'org::allbinary::game::input::InputFactory'->getInstance()->{MAX};
        for (my $index = 0; $index < $total; $index++) {
            my $inputProcessorCanBeNull = $inputProcessorArray->[$index];
            if (!defined($inputProcessorCanBeNull)) {
                $inputProcessorArray->[$index] = $noInputProcessor;
            }
        }
}

use org::allbinary::game::input::GameInputProcessor;
use org::allbinary::game::input::InputFactory;

1;

