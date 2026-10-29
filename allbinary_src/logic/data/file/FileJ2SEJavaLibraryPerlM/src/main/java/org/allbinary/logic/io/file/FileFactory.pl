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

package org::allbinary::logic::io::file::FileFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::FileFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileFactory::instance;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $filePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->createAbFileFromRawPath($filePath);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $file, $childFilePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->createAbFileWithChild($file, $childFilePath);
}


# throws Exception
sub isFile {
    my ($self, $path) = @_;
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile($path);
        if ($file->exists()) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::logic::io::file::AbFile;

1;

