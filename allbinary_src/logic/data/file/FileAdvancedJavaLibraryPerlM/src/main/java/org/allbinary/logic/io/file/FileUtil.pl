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

#data/init/views/TestStore/template/type/genericTemplateObjectConfig.xml
package org::allbinary::logic::io::file::FileUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::FileUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
    $self->{logConfigTypeFactory} = 'org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{streamUtil} = 'org::allbinary::logic::io::StreamUtil'->getInstance();
    $self->{WRITE_LABEL} = "Write file: ";
    $self->{DATA_LABEL} = " data: ";
    $self->{WRITE_METHOD} = "write";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub write {
    my ($self, $inputStream, $file) = @_;
        my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($file);
        $self->write($inputStream, $dataOutputStream);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $inputStream, $dataOutputStream) = @_;
        try {
            $dataOutputStream = 'org::allbinary::logic::io::StreamUtil'->getInstance()->get($inputStream, $dataOutputStream, [(0) x (16384)]);
            $dataOutputStream->flush();
        } catch ($exception) { die $exception; } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataOutputStream);
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $inputStream, $dataOutputStream, $buffer) = @_;
        try {
            $dataOutputStream = 'org::allbinary::logic::io::StreamUtil'->getInstance()->get($inputStream, $dataOutputStream, $buffer);
            $dataOutputStream->flush();
        } catch ($exception) { die $exception; } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataOutputStream);
        }
}


# throws Exception
sub copy {
    my ($self, $dataInputStream, $dataOutputStream) = @_;
        try {
            $dataOutputStream = 'org::allbinary::logic::io::StreamUtil'->getInstance()->get($dataInputStream, $dataOutputStream, [(0) x (16384)]);
            $dataOutputStream->flush();
        } catch ($exception) { die $exception; } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataOutputStream);
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataInputStream);
        }
}


# throws Exception
sub fixPath {
    my ($self, $file, $path, $realPath, $cloud) = @_;
        my $beginIndex = $file->getPath()->indexOf($cloud) + length($cloud);
        my $endIndex = $file->getPath()->indexOf($file->getName());
        my $fixedPathString = $realPath->toFileSystemString() . $file->getPath()->substring($beginIndex, $endIndex);
        my $fixedPath = 'org::allbinary::logic::io::path::AbPath'->new($fixedPathString, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->{directory}->create($fixedPath);
        my $string = $fixedPath->toFileSystemString();
        if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
            $self->{logUtil}->putF($string, $self, "fixPath");
        }
        my $outPath = 'org::allbinary::logic::io::path::AbPath'->new($string, $file->getName());
        return $outPath;
}


# throws Exception
sub copyToCloud {
    my ($self, $file, $path, $realPath, $cloud) = @_;
        $self->copyToCloud($file, $path, $realPath, $cloud, 0, 0);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub copyToCloud {
    my ($self, $file, $path, $realPath, $cloud, $overwriteNewer, $overwriteAll) = @_;
        try {
            my $outPath = $self->fixPath($file, $path, $realPath, $cloud);
            my $outFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($outPath);
            if (!$self->copyPrepare($file, $outFile, $overwriteNewer, $overwriteAll)) {
                return;
            } else {
                if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("Out File: ");
                    $stringBuffer->append($outFile->getPath());
                    $stringBuffer->append(" In File: ");
                    $stringBuffer->append($file->getPath());
                    $stringBuffer->append(" to cloud.");
                    $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyToCloud");
                }
            }
            my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($outFile);
            my $fileInputStream = 'org::allbinary::logic::io::AbFileLocalInputStream'->new($file);
            $self->copy($fileInputStream, $dataOutputStream);
        } catch ($e) {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILEERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Error Copying File File: ");
                $stringBuffer->append($file->toString());
                $stringBuffer->append(" to cloud.");
                $self->{logUtil}->put($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyToCloud", $e);
            }
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub copyToCloud {
    my ($self, $file, $outFile) = @_;
        $self->copyToCloud($file, $outFile, 0, 0);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub copyToCloud {
    my ($self, $file, $outFile, $overwriteNewer, $overwriteAll) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (!$self->copyPrepare($file, $outFile, $overwriteNewer, $overwriteAll)) {
                return;
            } else {
                if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append("Out File: ");
                    $stringBuffer->append($outFile->getPath());
                    $stringBuffer->append(" In File: ");
                    $stringBuffer->append($file->getPath());
                    $stringBuffer->append(" to cloud.");
                    $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyToCloud");
                }
            }
            my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($outFile);
            my $fileInputStream = 'org::allbinary::logic::io::AbFileLocalInputStream'->new($file);
            $self->copy($fileInputStream, $dataOutputStream);
        } catch ($e) {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILEERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Error Copying File File: ");
                $stringBuffer->append($file->toString());
                $stringBuffer->append(" to cloud.");
                $self->{logUtil}->put($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyToCloud", $e);
            }
            die $e;
        }
}


# throws Exception
sub copyPrepare {
    my ($self, $fromFile, $toFile, $overwriteNewer, $overwriteAll) = @_;
        if ($toFile->exists()) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if ($overwriteAll) {
                if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append("Overwriting File: ");
                    $stringBuffer->append($toFile->getPath());
                    $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyFile");
                }
                $toFile->delete();
                $toFile->createNewFile();
            } elsif ($toFile->lastModified() < $fromFile->lastModified() && $overwriteNewer) {
                if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append("Newer by: ");
                    $stringBuffer->appendlong(int($fromFile->lastModified() - $toFile->lastModified()));
                    $stringBuffer->append("ms ");
                    $stringBuffer->append("Copying File: ");
                    $stringBuffer->append($toFile->getPath());
                    $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyFile");
                }
                $toFile->delete();
                $toFile->createNewFile();
            } else {
                if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append("File Already Exists");
                    if ($overwriteNewer) {
                        $stringBuffer->append(" And Is Not Older");
                    } else {
                        $stringBuffer->append(" And Not A In Overwrite Mode");
                    }
                    $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP});
                    $stringBuffer->append($toFile->getPath());
                    $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyFile");
                }
                return 0;
            }
        } else {
            $toFile->createNewFile();
        }
        return 1;
}


# throws Exception
sub copyFile {
    my ($self, $fromFile, $toFile) = @_;
        $self->copyFile($fromFile, $toFile, 0, 0);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub copyFile {
    my ($self, $fromFile, $toFile, $overwriteNewer, $overwriteAll) = @_;
        try {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Copying ");
                $stringBuffer->appendlong($fromFile->length());
                $stringBuffer->append(" bytes from File: ");
                $stringBuffer->append($fromFile->getPath());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($toFile->getPath());
                $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyFile");
            }
            if (!$self->copyPrepare($fromFile, $toFile, $overwriteNewer, $overwriteAll)) {
                return;
            }
            my $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($toFile);
            my $fileInputStream = 'org::allbinary::logic::io::AbFileInputStream'->new($fromFile);
            $self->copy($fileInputStream, $dataOutputStream);
        } catch ($e) {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILEERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Error Copying File fromFile: ");
                $stringBuffer->append($fromFile->toString());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($toFile->toString());
                $self->{logUtil}->put($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyFile", $e);
            }
            die $e;
        }
}


sub getNewDirectory {
    my ($class, $fromFile) = @_;
        my $newDirectory = $fromFile->getPath();
        my $separatorChar = 'org::allbinary::logic::io::file::FilePathData'->getInstance()->{PATH_START};
        if ('org::allbinary::logic::io::AbIOSystem'->getInstance()->isType("com.vobject.appengine.java.io")) {
            $separatorChar = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
        }
        my $lastIndex = rindex($newDirectory, $separatorChar);
        if ($lastIndex >= length($newDirectory)) {
            $newDirectory = substr($newDirectory, 0, (length($newDirectory) - 1) - (0));
            $lastIndex = rindex($newDirectory, $separatorChar);
        }
        return substr($newDirectory, $lastIndex, (length($newDirectory)) - ($lastIndex));
}


# throws Exception
sub copyDirectoryPortion {
    my ($self, $fromDirectoryAbPath, $toDirectoryAbPath, $overwriteNewer, $overwriteAll, $current, $total) = @_;
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($fromDirectoryAbPath);
        if (!$file->isDirectory()) {
            die ("Not a directory: " . $file->getPath());
        }
        my $fileList = $self->{directory}->search($file, 1);
        my $size = $fileList->size();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Searched: ");
        $stringBuffer->append($file->getPath());
        $stringBuffer->append(" Total: ");
        $stringBuffer->appendint($size);
        my $portion = int($size / $total) + 1;
        my $start = $portion * $current;
        my $end = $start + $portion;
        if ($end > $size) {
            $end = $size;
        }
        $stringBuffer->append(" Section: ");
        $stringBuffer->appendint($start);
        $stringBuffer->append(" - ");
        $stringBuffer->appendint($end);
        if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
            $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copySomeFilesToDirectory()");
        }
        my $nextFile = undef;
        for (my $index = $start; $index < $end; $index++) {
            $nextFile = $fileList->get($index);
            if ($nextFile->isDirectory()) {
            } else {
                my $path = 'org::allbinary::logic::io::path::AbPath'->new($nextFile->getPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING})->getPath();
                my $beginIndex = $fromDirectoryAbPath->getPath()->length();
                if ($path->indexOf('org::allbinary::globals::URLGLOBALS'->getWebappPath()) < 0) {
                    $beginIndex -= 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING})->getPath()->length();
                }
                my $newPath = $toDirectoryAbPath->toFileSystemString() . $path->substring($beginIndex);
                my $toFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath('org::allbinary::logic::io::path::AbPath'->new($newPath, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}));
                $self->copyFile($nextFile, $toFile, $overwriteNewer, $overwriteAll);
            }
        }
}


# throws Exception
sub copyDirectory {
    my ($self, $fromFile, $to) = @_;
        try {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Copying Directory from: ");
                $stringBuffer->append($fromFile->getPath());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($to->getPath());
                $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyDirectory");
            }
            my $newDirectory = 'org::allbinary::logic::io::file::FileUtil'->getNewDirectory($fromFile);
            my $newDirectoryAbPath = 'org::allbinary::logic::io::path::AbPath'->new($to->getPath() + 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR} . $newDirectory, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            if (!$self->{directory}->create($newDirectoryAbPath)) {
                die ("Failed to create directory: " . $newDirectoryAbPath);
            }
            my $fileArray = 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFiles($fromFile->listFiles());
            my $size = scalar(@{$fileArray});
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Copying ");
                $stringBuffer->appendint($size);
                $stringBuffer->append(" files from: ");
                $stringBuffer->append($fromFile->getPath());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($to->getPath());
                $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyDirectory");
            }
            my $file = undef;
            for (my $index = 0; $index < $size; $index++) {
                $file = $fileArray->[$index];
                if ($file->isFile()) {
                    $self->copyFile($file, 'org::allbinary::logic::io::file::AbFile'->createAbFilePathAndName($newDirectoryAbPath->toString(), $file->getName()));
                } elsif ($file->isDirectory()) {
                    $self->copyDirectory($file, 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($newDirectoryAbPath));
                } else {
                    die ("File Copy Error");
                }
            }
        } catch ($e) {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILEERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Error Copying Directory fromFile: ");
                $stringBuffer->append($fromFile->toString());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($to->toString());
                $self->{logUtil}->put($stringBuffer->toString(), __PACKAGE__->getInstance(), "copyDirectory", $e);
            }
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub copy {
    my ($self, $fromAbPath, $to) = @_;
        my $COPY = "copy";
        try {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Copying AbPaths from: ");
                $stringBuffer->append($fromAbPath->toString());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($to->toString());
                $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), $COPY);
            }
            if (!defined($fromAbPath)) {
                die ("Cannot Copy From A Null Location");
            }
            if (!defined($to)) {
                die ("Cannot Copy To A Null Location");
            }
            my $fromLocationFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($fromAbPath);
            my $toLocationFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($to);
            if ($fromLocationFile->isFile()) {
                if ($toLocationFile->isDirectory()) {
                    my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileWithChild($toLocationFile, $fromLocationFile->getName());
                    $self->copyFile($fromLocationFile, $file);
                    if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("Copied file=");
                        $stringBuffer->append($fromLocationFile->getName());
                        $stringBuffer->append(" from: ");
                        $stringBuffer->append($fromLocationFile->getPath());
                        $stringBuffer->append(" to: ");
                        $stringBuffer->append($toLocationFile->getPath());
                        $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), $COPY);
                    }
                } else {
                    $self->copyFile($fromLocationFile, $toLocationFile);
                    if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("Copied file with new name ");
                        $stringBuffer->append(" from: ");
                        $stringBuffer->append($fromLocationFile->getPath());
                        $stringBuffer->append(" to: ");
                        $stringBuffer->append($toLocationFile->getPath());
                        $self->{logUtil}->putF($stringBuffer->toString(), __PACKAGE__->getInstance(), $COPY);
                    }
                }
            } elsif ($fromLocationFile->isDirectory() && $toLocationFile->isDirectory()) {
                if ($fromAbPath->toFileSystemString()->charAt($fromAbPath->toFileSystemString()->length() - 1) eq $org::allbinary::logic::io::file::java::io->{File}->{separatorChar}) {
                    if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                        $self->{logUtil}->putF("Copying subdirectories", __PACKAGE__->getInstance(), $COPY);
                    }
                    my $fileArray = 'org::allbinary::logic::io::file::FileWrapperUtil'->wrapFiles($fromLocationFile->listFiles());
                    for (my $index = 0; $index < scalar(@{$fileArray}); $index++) {
                        my $file = $fileArray->[$index];
                        if ($file->isFile()) {
                            my $aFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileWithChild($toLocationFile, $file->getName());
                            $self->copyFile($file, $aFile);
                        } elsif ($file->isDirectory()) {
                            $self->copyDirectory($file, $toLocationFile);
                        } else {
                            die ("File Copy Error");
                        }
                    }
                    if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                        $self->{logUtil}->putF("Copied subdirectories", __PACKAGE__->getInstance(), $COPY);
                    }
                } else {
                    if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                        $self->{logUtil}->putF("Copyinhg directory", __PACKAGE__->getInstance(), $COPY);
                    }
                    $self->copyDirectory($fromLocationFile, $toLocationFile);
                    if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILE})) {
                        $self->{logUtil}->putF("Copied directory", __PACKAGE__->getInstance(), $COPY);
                    }
                }
            }
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::io::file::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($self->{logConfigTypeFactory}->{FILEERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Error Copying fromAbPath: ");
                $stringBuffer->append($fromAbPath->toString());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($to->toString());
                $self->{logUtil}->put($stringBuffer->toString(), __PACKAGE__->getInstance(), $COPY, $e);
            }
            die $e;
        }
}


sub shouldSkip {
    my ($self, $file, $skipFiles) = @_;
        my $size = scalar(@{$skipFiles});
        my $skipFile = undef;
        for (my $index = 0; $index < $size; $index++) {
            $skipFile = $skipFiles->[$index];
            if ($file->getPath()->compareTo($skipFile) == 0) {
                return 1;
            }
        }
        return 0;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $filePath, $string) = @_;
        my $dataOutputStream = undef;
        try {
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{WRITE_LABEL})->append($filePath)->append($self->{DATA_LABEL})->append($string)->toString(), $self, $self->{WRITE_METHOD});
            my $fileInputStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
            my $fileOutputStream = $fileInputStreamFactory->getFileOutputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $filePath);
            $dataOutputStream = 'org::allbinary::logic::io::AbDataOutputStream'->new($fileOutputStream);
            $dataOutputStream->write([unpack("C*", $string)], 0, length($string));
            $dataOutputStream->flush();
        } catch ($exception) { die $exception; } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataOutputStream);
        }
}


sub loadFileAsList {
    my ($self, $file, $max, $byteArray1) = @_;
        return 'org::allbinary::logic::io::file::FileUtil2'->getInstance()->loadFileAsList($file, $max, $byteArray1);
}

# use java::io::InputStream;
# use java::io::OutputStream;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::AbFileLocalInputStream;
use org::allbinary::logic::io::AbIOSystem;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::FileStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FilePathData;
use org::allbinary::logic::io::file::FileWrapperUtil;
use org::allbinary::logic::io::file::FileUtil2;

1;

