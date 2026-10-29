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

package org::allbinary::logic::visual::transform::info::CustomTransformInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfo','org::allbinary::logic::visual::transform::info::TransformInfoInterface';



sub new {
    my ($class, $outputTypeName, $inputOutputTypeName, $inputOutputTypeFile, $name, $objectFileName, $objectConfigFileName, $templateFileName, $dataFileName) = @_;
    my $self = $class->SUPER::new();
    return $self;
}

use org::allbinary::logic::visual::transform::info::TransformInfo;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;

1;

