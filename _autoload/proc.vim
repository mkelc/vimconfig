
if exists("loaded_proc_perl")
   finish
endif

let loaded_proc_perl= 1

function! proc#initperl()
   if !exists("g:proc_perl")
      perl <<EOF
use File::Spec;

sub which {
   my $file= shift;
   for my $path (File::Spec->path()) {
      my $full= File::Spec->catfile($path,$file); 
      if (-x $full ) {
         return $full;
      }
   }
   return "";
}

sub start {
   my $name= shift;
   unless (File::Spec->file_name_is_absolute($name)) {
      $name= which($name);
   }
   if ($^O =~ /Win32/) {
      require Win32::Process;
      require Win32;
      Win32::Process::Create($ProcessObj, $name, "", 0, NORMAL_PRIORITY_CLASS, ".") 
      || print Win32::FormatMessage( Win32::GetLastError() );
   } else {
      my $pid= fork();
      unless ($pid) {
         exec($name);
      }
   }
}
EOF
   endif
   let g:proc_perl= 1
endfunction
