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

# Java interface
package org::allbinary::animation::resource::FeatureResourceAnimationInterfaceFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::resource::ResourceAnimationInterfaceFactoryInterface','org::allbinary::game::resource::RectangleResourceFactoryInterface','org::allbinary::game::configuration::feature::GameFeatureControlledInterface';



sub getHashtable {
    my ($self) = @_;
    die "abstract method getHashtable";
}

use org::allbinary::game::configuration::feature::GameFeatureControlledInterface;
use org::allbinary::game::resource::RectangleResourceFactoryInterface;
use org::allbinary::util::ABHashtable;
use org::allbinary::animation::resource::ResourceAnimationInterfaceFactoryInterface;

1;

