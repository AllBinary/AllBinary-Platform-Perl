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

package org::allbinary::data::generator::OrderItemIdGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::generator::UniqueIdGenerator';


sub _init_fields {
    my ($self) = @_;
    $self->{IDFILE} = "orderitemId.unq";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
        $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH});
        $stringBuffer->append($self->{IDFILE});
        $stringBuffer->append($org::allbinary::data::generator::UniqueIdGenerator::EXT);
        $self->SUPER::setFile($stringBuffer->toString(), $self->{IDFILE});
    return $self;
}

use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::generator::UniqueIdGenerator;

1;

