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

package org::allbinary::logic::java::array::IntArrayUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub toString {
    my ($class, $array) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < scalar(@{$array}); $index++) {
            $stringBuffer->appendint($array->[$index]);
            if ($index < scalar(@{$array})) {
                $stringBuffer->append(", ");
            }
        }
        return $stringBuffer->toString();
}


# Java overloaded method: Perl keeps the last definition
sub toString {
    my ($class, $array) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < scalar(@{$array}); $index++) {
            $stringBuffer->append("{");
            for (my $index2 = 0; $index2 < scalar(@{$array->[$index]}); $index2++) {
                $stringBuffer->appendint(int($array->[$index]->[$index2]));
                if ($index2 < scalar(@{$array->[$index]}) - 1) {
                    $stringBuffer->append(", ");
                }
            }
            $stringBuffer->append("}");
            if ($index < scalar(@{$array}) - 1) {
                $stringBuffer->append(", \n");
            }
        }
        return $stringBuffer->toString();
}


# Java overloaded method: Perl keeps the last definition
sub toString {
    my ($class, $array) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < scalar(@{$array}); $index++) {
            $stringBuffer->append("{");
            for (my $index2 = 0; $index2 < scalar(@{$array->[$index]}); $index2++) {
                $stringBuffer->append("{");
                for (my $index3 = 0; $index3 < scalar(@{$array->[$index]->[$index2]}); $index3++) {
                    $stringBuffer->appendint(int($array->[$index]->[$index2]->[$index3]));
                    if ($index3 < scalar(@{$array->[$index]->[$index2]}) - 1) {
                        $stringBuffer->append(", ");
                    }
                }
                $stringBuffer->append("}");
                if ($index2 < scalar(@{$array->[$index]}) - 1) {
                    $stringBuffer->append(", ");
                }
            }
            $stringBuffer->append("}");
            if ($index < scalar(@{$array}) - 1) {
                $stringBuffer->append(", \n");
            }
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;

1;

