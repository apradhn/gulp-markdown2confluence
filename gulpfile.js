var gulp = require('gulp')
var exec = require('child_process').exec;

gulp.task('md2Confluence', function() {
    exec('ruby lib/convert_to_confluence.rb', function(err, stdout, stderr) {
        console.log('stdout:' + stdout);
        console.log('stderr:' + stderr);
        console.log('err:' + err);
        });
});

gulp.task('watch', function() {
    gulp.watch('./markdown/*.md', ['md2Confluence'])
})