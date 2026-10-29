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

package org::allbinary::util::BasicArrayListS;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::util::BasicArrayList';



sub new {
    my ($class, $size) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT_ARRAY});
        # super(...) made $self above
        if ($size < 0) {
            die ('org::allbinary::logic::string::StringMaker'->new()->append("Init Size Exception: ")->appendint($size)->toString());
        }
        $self->{objectArray} = [(undef) x ($size)];
    return $self;
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringMaker;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::util::BasicArrayList;

1;

