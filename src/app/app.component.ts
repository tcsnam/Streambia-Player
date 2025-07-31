import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: true,
  template: `
    <h1>Welcome to Streambia Player!</h1>
    <p>Your Angular app is running.</p>
  `,
  styles: [`
    h1 { color: #ff6f00; }
    p { color: #00b8d4; }
  `]
})
export class AppComponent {}
