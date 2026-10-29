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

package org::allbinary::logic::io::FileStreamFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::logic::io::FileStreamFactory::SINGLETON == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::logic::io::FileStreamFactory::SINGLETON = 'org::allbinary::logic::io::FileStreamFactory'->new();
        }
        return $org::allbinary::logic::io::FileStreamFactory::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getFileInputStreamInstance {
    my ($self, $path, $fileName) = @_;
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new($path, $fileName);
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
        return 'org::allbinary::logic::io::AbFileInputStream'->new($file);
}


# throws Exception
sub getFileOutputStreamInstance {
    my ($self, $path, $fileName) = @_;
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new($path, $fileName);
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
        if ($file->exists()) {
            $file->delete();
            $file->createNewFile();
        }
        return 'org::allbinary::logic::io::AbFileOutputStream'->createFromAbFile($file);
}


# throws Exception
sub delete {
    my ($self, $path, $fileName) = @_;
        my $FILEABPATH = 'org::allbinary::logic::io::path::AbPath'->new($path, $fileName);
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($FILEABPATH);
        $file->delete();
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::AbFileOutputStream;

1;

