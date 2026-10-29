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

package org::allbinary::game::layer::LayerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $HASHTABLE = "Hashtable: ";

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub toString {
    my ($class, $hashtable, $x, $y, $z) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $positionStrings = 'org::allbinary::math::PositionStrings'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($org::allbinary::game::layer::LayerUtil::HASHTABLE);
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($hashtable));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{X_LABEL});
        $stringBuffer->appendint($x);
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{Y_LABEL});
        $stringBuffer->appendint($y);
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{Z_LABEL});
        $stringBuffer->appendint($z);
        return $stringBuffer->toString();
}

use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::PositionStrings;
use org::allbinary::util::ABHashtable;

1;

