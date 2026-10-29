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

package org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoImageFileUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
    $self->{fileName} = undef;
    $self->{imageFileAbPath} = undef;
}


sub new {
    my ($class, $imageAbPath, $imageFile) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{fileName} = $imageFile;
        $self->{imageFileAbPath} = $imageAbPath;
    return $self;
}


# throws Exception
sub saveFiles {
    my ($self, $fileItem) = @_;
        if (!defined($self->{fileName})) {
            die ("Image File Name Was Null");
        }
        if (!$self->{directory}->create($self->{imageFileAbPath})) {
            die ("Unable to save file to non creatable directory");
        }
        my $originalImageFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($self->{imageFileAbPath}->toString() . $self->{fileName});
        $originalImageFile->createNewFile();
        'org::allbinary::logic::io::file::FileUtil'->getInstance()->write('java::io::ByteArrayInputStream'->new($fileItem->get()), $originalImageFile);
}

# use java::io::ByteArrayInputStream;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::apache::commons::fileupload::FileItem;

1;

