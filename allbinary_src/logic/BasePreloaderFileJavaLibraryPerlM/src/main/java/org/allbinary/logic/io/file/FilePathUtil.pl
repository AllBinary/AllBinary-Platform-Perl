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

#Used to correct user input for paths
package org::allbinary::logic::io::file::FilePathUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub adjust {
    my ($class, $path) = @_;
        my $abPathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        my $filePathData = 'org::allbinary::logic::io::file::FilePathData'->getInstance();
        if ($stringValidationUtil->isEmpty($path)) {
            return $filePathData->{PATH_START};
        }
        $path = join($filePathData->{SEPARATORCHAR}, split(quotemeta($abPathData->{SEPARATORCHAR}), $path, -1));
        return $path;
}

use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::io::file::FilePathData;

1;

