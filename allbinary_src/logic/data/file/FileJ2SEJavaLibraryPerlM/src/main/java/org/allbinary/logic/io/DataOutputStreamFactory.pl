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

package org::allbinary::logic::io::DataOutputStreamFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::DataOutputStreamFactory'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::io::DataOutputStreamFactory::instance;
}


# throws Exception
sub getInstanceForAbFile {
    my ($self, $file) = @_;
        my $idFileOutputStream = 'org::allbinary::logic::io::AbFileOutputStream'->createFromAbFile($file);
        my $idOutData = 'org::allbinary::logic::io::AbDataOutputStream'->new($idFileOutputStream);
        return $idOutData;
}


# throws Exception
sub getInstance_j2 {
    my ($self, $filePath, $fileName) = @_;
        my $fileStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
        my $fileOutputStream = $fileStreamFactory->getFileOutputStreamInstance($filePath, $fileName);
        my $idOutData = 'org::allbinary::logic::io::AbDataOutputStream'->new($fileOutputStream);
        return $idOutData;
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::logic::io::AbFileOutputStream ();
use org::allbinary::logic::io::AbDataOutputStream ();
use org::allbinary::logic::io::FileStreamFactory ();

1;

