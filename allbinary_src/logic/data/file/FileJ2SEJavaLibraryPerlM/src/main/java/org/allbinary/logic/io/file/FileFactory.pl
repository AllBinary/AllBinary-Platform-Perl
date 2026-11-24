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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::file::FileFactory'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileFactory::instance;
}


# throws Exception
sub getInstance_j1 {
    my ($self, $filePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->createAbFileFromRawPath($filePath);
}


# throws Exception
sub getInstance_j2 {
    my ($self, $file, $childFilePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->createAbFileWithChild($file, $childFilePath);
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::io::file::AbFile ();

1;

