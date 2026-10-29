# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

#Do not use this instead just skip target, build, Application paths.
package org::allbinary::java::runtime::process::git::GitProcessHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::java::runtime::process::git::GitProcessHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{trackedStrings} = 'org::allbinary::logic::io::file::directory::TrackedStrings'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::java::runtime::process::git::GitProcessHelper::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $THIS_IS_SLOW = "This is slow consider path exclusion instead";
        $logUtil->putF($THIS_IS_SLOW, $self, $commonStrings->{CONSTRUCTOR});
    return $self;
}


# throws IOException, InterruptedException
sub trackedFiles {
    my ($self, $rootAsString, $pathspec) = @_;
        return $self->trackedFiles($rootAsString, $pathspec, ".java");
}


# throws IOException, InterruptedException
# Java overloaded method: Perl keeps the last definition
sub trackedFiles {
    my ($self, $rootAsString, $pathspec, $suffix) = @_;
        my $process = 'org::allbinary::java::runtime::process::git::ProcessBuilder'->new($self->{trackedStrings}->{GIT_COMMAND}, $self->{trackedStrings}->{CHANGE_DIRECTORY_OPTION}, $rootAsString, $self->{trackedStrings}->{LIST_FILES_COMMAND}, $self->{trackedStrings}->{SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE}, $self->{trackedStrings}->{PATHSPEC_SEPARATOR}, $pathspec)->redirectError($org::allbinary::java::runtime::process::git::ProcessBuilder::Redirect->{INHERIT})->start();
        my $output = $process->getInputStream()->readAllBytes();
        my $exitCode = $process->waitFor();
        if ($exitCode != 0) {
            die ('org::allbinary::logic::string::StringMaker'->new()->append("git ls-files failed for ")->append($rootAsString)->append(" with exit code ")->appendint($exitCode)->toString());
        }
        my $files = 'java::util::ArrayList'->new();
        my $start = 0;
        my $relativePath = undef;
        for (my $index = 0; $index < scalar(@{$output}); $index++) {
            if ($output->[$index] == 0) {
                $relativePath = pack("C*", @{$output, $start, $index - $start, $java::nio::charset::StandardCharsets::UTF_8});
                if ((substr($relativePath, -length($suffix)) eq $suffix)) {
                    $files->add($relativePath);
                }
                $start = $index + 1;
            }
        }
        return $files;
}


sub isTracked {
    my ($self, $file) = @_;
        try {
            my $nativeFile = 'org::allbinary::logic::io::file::AbFileNativeUtil'->get($file);
            my $parentFile = $nativeFile->getParentFile();
            my $process = 'org::allbinary::java::runtime::process::git::ProcessBuilder'->new($self->{trackedStrings}->{GIT_COMMAND}, $self->{trackedStrings}->{CHANGE_DIRECTORY_OPTION}, $parentFile->getPath(), $self->{trackedStrings}->{LIST_FILES_COMMAND}, $self->{trackedStrings}->{ERROR_UNMATCH_OPTION}, $self->{trackedStrings}->{PATHSPEC_SEPARATOR}, $nativeFile->getName())->redirectErrorStream(1)->start();
            $process->getInputStream()->readAllBytes();
            return $process->waitFor() == 0;
        } catch ($e) {
            return 0;
        }
}

use java::io::File;
# use java::io::IOException;
# use java::nio::charset::StandardCharsets;
use java::util::ArrayList;
# use java::util::List;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;
use org::allbinary::logic::io::file::directory::TrackedStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::java::runtime::process::git::ProcessBuilder;

1;

