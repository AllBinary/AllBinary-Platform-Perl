# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::graphics::opengles::shader::Shader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{shaderName} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{shaderStringList} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{shaderAsString} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{shaderHandle} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;

1;

